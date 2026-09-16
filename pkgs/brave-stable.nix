{ callPackage, fetchurl }:
let
  version = "1.95.102";
  hash = "1zmx3227h4y4pq4brd71lf1w1knbxbll7ac8fcrf6fy8azz100ck";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.95.102/brave-browser_1.95.102_amd64.deb";
}
