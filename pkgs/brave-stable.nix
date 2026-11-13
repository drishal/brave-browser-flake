{ callPackage, fetchurl }:
let
  version = "1.100.56";
  hash = "07f1yr5gdi97ps575anxbczjqb2q14xcgizbsdfc9fas9siy3sc9";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.100.56/brave-browser_1.100.56_amd64.deb";
}
