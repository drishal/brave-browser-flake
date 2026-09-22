{ callPackage, fetchurl }:
let
  version = "1.96.57";
  hash = "0gpyv8ghi4zrnq0fl43srcmn5lm6zq68153hr1ba7n4794yli577";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.96.57/brave-browser_1.96.57_amd64.deb";
}
