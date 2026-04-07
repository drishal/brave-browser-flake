{ callPackage, fetchurl }:
let
  version = "1.90.97";
  hash = "1nqvjjzb9hdr4j42cpl34xwg5nwd83inb1kvlj1qajm6310i3sc8";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}