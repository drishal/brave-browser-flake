{ callPackage, fetchurl }:
let
  version = "1.95.100";
  hash = "1gjkskk558f0qzxh1jvp2qxs8w31z6yycjxqj6rff3l5vb3nc9m0";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.95.100/brave-browser_1.95.100_amd64.deb";
}
