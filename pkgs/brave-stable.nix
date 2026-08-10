{ callPackage, fetchurl }:
let
  version = "1.93.135";
  hash = "14h6pgw5yc3vxpqjlkgs656jnf9z04sy9m857gqsd2svrcf5zjjv";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.93.135/brave-browser_1.93.135_amd64.deb";
}
