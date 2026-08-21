{ callPackage, fetchurl }:
let
  version = "1.93.138";
  hash = "17xchqar2rwgr0kzr8cv13zi6gsjp72889362cg28rzh8gab466g";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.93.138/brave-browser_1.93.138_amd64.deb";
}
