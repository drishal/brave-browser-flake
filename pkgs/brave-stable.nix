{ callPackage, fetchurl }:
let
  version = "1.95.101";
  hash = "1k3k3izx4v02l7rqhp0ihs5awv2zzgg5app546w96z8i41caahbw";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.95.101/brave-browser_1.95.101_amd64.deb";
}
