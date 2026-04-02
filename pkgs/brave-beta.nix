{ callPackage, fetchurl }:
let
  version = "1.89.128";
  hash = "1xj26gwa8w624zlcd76m2z5fra7ifys1s2zqyvs2fyciwnwvgzp7";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}