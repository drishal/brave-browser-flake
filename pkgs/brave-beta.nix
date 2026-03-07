{ callPackage, fetchurl }:
let
  version = "1.89.105";
  hash = "1b3jsf0jb8b1qgyby41cd2pvdg19ji913fb86mnmggpbsz3q794j";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}