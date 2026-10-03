{ callPackage, fetchurl }:
let
  version = "1.96.61";
  hash = "1jxp9cwwk4afbz6iinycak83ych5qcr421hccdwqjf9i9v7k5s2h";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.96.61/brave-browser_1.96.61_amd64.deb";
}
