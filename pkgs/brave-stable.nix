{ callPackage, fetchurl }:
let
  version = "1.97.54";
  hash = "1wa2xcgzd7lqn4wd94x270ppqib5r6f5kc8qpllsc5ffyvaw3i7l";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.97.54/brave-browser_1.97.54_amd64.deb";
}
