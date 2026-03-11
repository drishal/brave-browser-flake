{ callPackage, fetchurl }:
let
  version = "1.89.109";
  hash = "0rjh8iabr4s56d8km5rly0l1kflr7j5dvbjc49m08kb2f4gd9d9p";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}