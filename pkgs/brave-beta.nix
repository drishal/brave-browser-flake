{ callPackage, fetchurl }:
let
  version = "1.90.112";
  hash = "062zk8h9pw4iik96yk6ca6ngrwx3y6sp3lbla7268hkx4n2729yb";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}