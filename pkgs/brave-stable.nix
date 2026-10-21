{ callPackage, fetchurl }:
let
  version = "1.98.60";
  hash = "1z32s0zy0pi9hv10ccf0kyg4abdwl1463v2xwm4spd9ifqfh0al1";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.98.60/brave-browser_1.98.60_amd64.deb";
}
