{ callPackage, fetchurl }:
let
  version = "1.89.123";
  hash = "0nm3abhfbqmvv3v71ry8mqd82lx7b01pv059by616fr5zw650y0m";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}