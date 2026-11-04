{ callPackage, fetchurl }:
let
  version = "1.99.54";
  hash = "0spk062zn1bdddhzswnz36rd0sw7gcs2sckyp4sxym24y4928jxq";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.99.54/brave-browser_1.99.54_amd64.deb";
}
