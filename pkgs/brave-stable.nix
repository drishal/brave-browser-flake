{ callPackage, fetchurl }:
let
  version = "1.100.57";
  hash = "1sfh2xada7cnyp3j00d7qk47zdzfz841qnadsxq6cmx2sqq216in";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.100.57/brave-browser_1.100.57_amd64.deb";
}
