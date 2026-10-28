{ callPackage, fetchurl }:
let
  version = "1.98.62";
  hash = "1hamnm9r38m3wanrcagqk075k6n2idhrhqbn5mb2pnr6fxv6qazv";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.98.62/brave-browser_1.98.62_amd64.deb";
}
