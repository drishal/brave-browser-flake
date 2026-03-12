{ callPackage, fetchurl }:
let
  version = "1.89.110";
  hash = "03cn8f7i8n9f1gn3d4y1jsacq1wi0gmrby1gdzzh2lc6zq6zw50b";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}