{ callPackage, fetchurl }:
let
  version = "1.98.63";
  hash = "0mfxrnssfr3lia1zi12zcg1mmpwqb7699cwd232vv7i5m7apq8i4";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.98.63/brave-browser_1.98.63_amd64.deb";
}
