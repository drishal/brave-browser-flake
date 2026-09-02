{ callPackage, fetchurl }:
let
  version = "1.94.119";
  hash = "0myjfyvx9hzf503bp8dz96jkr6ywcdj05x7w38ciyfs3xariv4f9";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.94.119/brave-browser_1.94.119_amd64.deb";
}
