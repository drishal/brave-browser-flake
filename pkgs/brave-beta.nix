{ callPackage, fetchurl }:
let
  version = "1.90.96";
  hash = "0jfradljyd9ymcflmc52radhir8ajvj06ps4xxxskck9yxd6m7bn";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}