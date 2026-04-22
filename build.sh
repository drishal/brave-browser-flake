#!/usr/bin/env bash

set -e

COMMIT=false
for arg in "$@"; do
  case $arg in
    --commit) COMMIT=true ;;
  esac
done

# Track updated versions for commit message
declare -A UPDATED_VERSIONS

update_channel() {
  local CHANNEL=$1
  local TARGET_FILE=$2

  echo "Updating $CHANNEL..."

  # Fetch the latest release data for the channel
  # We filter by name containing the channel AND having the specific .deb asset we need
  # (Brave sometimes publishes origin-only releases without brave-browser-* assets)
  local ASSET_PREFIX="brave-browser-${CHANNEL,,}_"
  RELEASE_DATA=$(curl -s "https://api.github.com/repos/brave/brave-browser/releases?per_page=100" | jq -r --arg channel "$CHANNEL" --arg prefix "$ASSET_PREFIX" \
    'map(select(.name? and (.name | contains($channel)) and .assets? and (.assets | any(.name | startswith($prefix) and endswith("_amd64.deb"))))) 
    | sort_by(.published_at) 
    | reverse 
    | .[0]
  ')

  if [ -z "$RELEASE_DATA" ] || [ "$RELEASE_DATA" == "null" ]; then
    echo "Error: Could not find latest release for $CHANNEL"
    return 1
  fi

  TAG_NAME=$(echo "$RELEASE_DATA" | jq -r '.tag_name')
  VERSION=${TAG_NAME#v}

  echo "Latest $CHANNEL version: $VERSION"

  # Find the amd64 .deb asset URL, filtering by the expected asset name prefix
  # (e.g., "brave-browser-nightly_" not "brave-origin-nightly_")
  ASSET_URL=$(echo "$RELEASE_DATA" | jq -r --arg prefix "$ASSET_PREFIX" \
    '.assets[] | select(.name | startswith($prefix) and endswith("_amd64.deb")) | .browser_download_url' | head -n 1)

  if [ -z "$ASSET_URL" ]; then
    echo "Error: Could not find amd64 .deb asset for version $VERSION"
    return 1
  fi

  echo "Asset URL: $ASSET_URL"

  # Prefetch the hash
  echo "Prefetching SRI hash..."
  HASH=$(nix-prefetch-url "$ASSET_URL")

  echo "Hash: $HASH"

  # Update the nix file
  # We look for `version = "..."` and `hash = "..."`
  sed -i "s/version = \".*\";/version = \"$VERSION\";/" "$TARGET_FILE"
  sed -i "s/hash = \".*\";/hash = \"$HASH\";/" "$TARGET_FILE"

  echo "Updated $TARGET_FILE with version $VERSION and hash $HASH"

  UPDATED_VERSIONS["$CHANNEL"]="$VERSION"
  echo "--------------------------------------------------"
}

update_stable_channel() {
  local TARGET_FILE=$1

  echo "Updating Brave Stable..."

  # Stable releases are the ones WITHOUT "Nightly" or "Beta" in the name
  RELEASE_DATA=$(curl -s "https://api.github.com/repos/brave/brave-browser/releases?per_page=100" | jq -r '
    map(select(.name? and (.name | test("Nightly|Beta") | not) and .assets? and (.assets | any(.name | endswith("_amd64.deb")))))
    | sort_by(.published_at)
    | reverse
    | .[0]
  ')

  if [ -z "$RELEASE_DATA" ] || [ "$RELEASE_DATA" == "null" ]; then
    echo "Error: Could not find latest stable release"
    return 1
  fi

  TAG_NAME=$(echo "$RELEASE_DATA" | jq -r '.tag_name')
  VERSION=${TAG_NAME#v}

  echo "Latest stable version: $VERSION"

  # Find the amd64 .deb asset URL — stable .deb is named brave-browser_${version}_amd64.deb
  ASSET_URL=$(echo "$RELEASE_DATA" | jq -r '.assets[] | select(.name | endswith("_amd64.deb") and (startswith("brave-browser_"))) | .browser_download_url' | head -n 1)

  if [ -z "$ASSET_URL" ]; then
    echo "Error: Could not find amd64 .deb asset for stable version $VERSION"
    return 1
  fi

  echo "Asset URL: $ASSET_URL"

  echo "Prefetching SRI hash..."
  HASH=$(nix-prefetch-url "$ASSET_URL")

  echo "Hash: $HASH"

  sed -i "s/version = \".*\";/version = \"$VERSION\";/" "$TARGET_FILE"
  sed -i "s/hash = \".*\";/hash = \"$HASH\";/" "$TARGET_FILE"

  echo "Updated $TARGET_FILE with version $VERSION and hash $HASH"

  UPDATED_VERSIONS["stable"]="$VERSION"
  echo "--------------------------------------------------"
}

update_apt_channel() {
  local APT_HOST=$1
  local PKG_NAME=$2
  local TARGET_FILE=$3

  echo "Updating $PKG_NAME from $APT_HOST..."

  # Brave Origin isn't published to GitHub releases, so we read the apt
  # repo's Packages index directly and pick the highest version.
  local PACKAGES_URL="https://${APT_HOST}/dists/stable/main/binary-amd64/Packages"

  # Download and normalize line endings (apt repos may use \r\n)
  local PACKAGES
  PACKAGES=$(curl -s "$PACKAGES_URL" | tr -d '\r')

  # Extract all matching package blocks using paragraph mode
  local BLOCKS
  BLOCKS=$(echo "$PACKAGES" | awk -v RS= -v pkg="$PKG_NAME" '$1 == "Package:" && $2 == pkg')

  if [ -z "$BLOCKS" ]; then
    echo "Error: Could not find $PKG_NAME in $PACKAGES_URL"
    return 1
  fi

  local VERSION FILENAME ASSET_URL HASH
  # Get the highest version across all matching blocks
  VERSION=$(echo "$BLOCKS" | awk '/^Version:/ { print $2 }' | sort -V | tail -n 1)
  # Get the filename for that specific version
  FILENAME=$(echo "$BLOCKS" | awk -v ver="$VERSION" '
    /^Version:/ { found = ($2 == ver) }
    found && /^Filename:/ { print $2; exit }
  ')
  ASSET_URL="https://${APT_HOST}/${FILENAME}"

  echo "Latest $PKG_NAME version: $VERSION"
  echo "Asset URL: $ASSET_URL"

  echo "Prefetching SRI hash..."
  HASH=$(nix-prefetch-url "$ASSET_URL")
  echo "Hash: $HASH"

  sed -i "s|version = \".*\";|version = \"$VERSION\";|" "$TARGET_FILE"
  sed -i "s|hash = \".*\";|hash = \"$HASH\";|" "$TARGET_FILE"

  echo "Updated $TARGET_FILE with version $VERSION and hash $HASH"

  UPDATED_VERSIONS["$PKG_NAME"]="$VERSION"
  echo "--------------------------------------------------"
}

update_channel "Nightly" "pkgs/brave-nightly.nix"
update_channel "Beta" "pkgs/brave-beta.nix"
update_apt_channel "brave-browser-apt-nightly.s3.brave.com" "brave-origin-nightly" "pkgs/brave-origin-nightly.nix"
update_stable_channel "pkgs/brave-stable.nix"
update_apt_channel "brave-browser-apt-beta.s3.brave.com" "brave-origin-beta" "pkgs/brave-origin-beta.nix"

if [ "$COMMIT" = true ]; then
  # Build commit message from updated versions
  MSG="chore: update brave versions"
  for channel in "${!UPDATED_VERSIONS[@]}"; do
    MSG="$MSG — $channel ${UPDATED_VERSIONS[$channel]}"
  done

  git add pkgs/*.nix
  git commit -m "$MSG"
  echo "Committed: $MSG"
fi