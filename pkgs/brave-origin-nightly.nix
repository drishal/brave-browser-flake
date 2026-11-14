{ callPackage, fetchurl }:
let
  version = "1.102.6";
  hash = "1wi0gcjz6hglyv0pjykzvmymnphp5bkarpwmmqs2ivfzv2w9w6i4";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_1.102.6_amd64.deb";
}
