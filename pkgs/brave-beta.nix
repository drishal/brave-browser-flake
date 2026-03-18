{ callPackage, fetchurl }:
let
  version = "1.89.116";
  hash = "1f249pr70s3an2r1hv7gzzmixps1syyyna5y63sb51zbf04vs2ba";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}