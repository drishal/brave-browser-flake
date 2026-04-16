# Brave Browser Previews Flake

[![Update Brave Nightly](https://github.com/kcalvelli/brave-browser-previews/actions/workflows/update.yml/badge.svg)](https://github.com/kcalvelli/brave-browser-previews/actions/workflows/update.yml)

A **Nix Flake** that provides the latest **Nightly**, **Beta**, and **Origin Nightly** versions of Brave Browser for Linux (`x86_64-linux`).

This repository is automatically updated daily to track the official [Brave GitHub Releases](https://github.com/brave/brave-browser/releases) and Brave's apt repositories.

## Features

- **Automated Updates**: A GitHub Action runs daily to fetch the latest versions and SRI hashes directly from Brave's release API and apt index.
- **Three Channels**:
    - **`brave-nightly`**: The bleeding-edge version. *Note: Enabled with `--enable-features=BraveAIChatAgentProfile` by default for AI Agent testing.*
    - **`brave-beta`**: The beta channel release.
    - **`brave-origin-nightly`**: [Brave Origin](https://brave.com/origin/) nightly — Brave's privacy/adblock/Shields stack without the extra features (Rewards, Wallet, AI, etc.).
- **Pure Flake**: Designed to be easily consumed as a flake input in your NixOS or Home Manager configuration.

## Usage

### 1. Add Input

Add this repository to your `flake.nix` inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Add brave-browser-previews
    brave-previews.url = "github:kcalvelli/brave-browser-previews";
    
    # Recommended: Follow your system's nixpkgs to avoid duplicate store paths
    brave-previews.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, brave-previews, ... }: {
    # Your configuration
  };
}
```

### 2. NixOS Configuration (Module)

This flake exports a NixOS module that allows you to configure Brave Nightly and Beta similarly to the standard `programs.chromium` module.

```nix
{ pkgs, brave-previews, ... }:

{
  imports = [
    brave-previews.nixosModules.default
  ];

  programs.brave-nightly = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
    ];
    defaultSearchProviderSearchURL = "https://search.brave.com/search?q={searchTerms}";
  };

  # You can also configure Beta independently
  programs.brave-beta.enable = true;

  # Or Brave Origin Nightly
  programs.brave-origin-nightly.enable = true;
}
```

### 3. Install Packages (Ad-hoc)

If you just want the packages without the configuration module:

```nix
{ pkgs, brave-previews, ... }:

{
  environment.systemPackages = [
    brave-previews.packages.${pkgs.system}.brave-nightly
  ];
}
```

#### Home Manager

In your `home.nix`:

```nix
{ pkgs, brave-previews, ... }:

{
  home.packages = [
    brave-previews.packages.${pkgs.system}.brave-nightly
  ];
}
```

### 4. Run Directly

You can also run the browsers without installing them:

```bash
# Run Nightly
nix run github:kcalvelli/brave-browser-previews#brave-nightly

# Run Beta
nix run github:kcalvelli/brave-browser-previews#brave-beta

# Run Origin Nightly
nix run github:kcalvelli/brave-browser-previews#brave-origin-nightly
```

## How It Works

1.  **`update.sh`**: A script queries the Brave GitHub API for Nightly/Beta releases, and reads `brave-browser-apt-nightly.s3.brave.com`'s `Packages` index for Origin Nightly (which isn't published to GitHub releases).
2.  **Prefetch**: It uses `nix-prefetch-url` to generate the correct SRI hash.
3.  **Update**: It modifies the matching file under `pkgs/` with the new version and hash.
4.  **CI/CD**: The `.github/workflows/update.yml` workflow runs this script daily, verifies the build using `nix build`, and commits the changes to the `master` branch.

## License

This project code is licensed under the MIT License.
Brave Browser itself is licensed under the [Mozilla Public License 2.0](https://github.com/brave/brave-browser/blob/master/LICENSE).
