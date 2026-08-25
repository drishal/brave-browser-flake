{ callPackage, fetchurl }:
let
  version = "1.94.116";
  hash = "0kkmf2p09f50q9dby8fw02f08k1qvm084n5n36d4rrw0l5561pz9";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.94.116/brave-browser_1.94.116_amd64.deb";
}
