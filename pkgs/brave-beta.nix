{ callPackage, fetchurl }:
let
  version = "1.89.121";
  hash = "17c4ds497s2vw1vl9qz65rgb68nlxsfmfkg9318zbzgb71ly6b2q";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}