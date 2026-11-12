{ callPackage, fetchurl }:
let
  version = "1.99.57";
  hash = "1mczvq1bg4frib8gapsn3fqs2f2lbcbm0m52v7gpjvgxyxblrlcc";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.99.57/brave-browser_1.99.57_amd64.deb";
}
