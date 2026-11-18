{ callPackage, fetchurl }:
let
  version = "1.100.58";
  hash = "19any5rx19yzhiarfj95w5yfbjq2wimq6k1jfwy38q7x9rk1x79d";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.100.58/brave-browser_1.100.58_amd64.deb";
}
