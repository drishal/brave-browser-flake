{ callPackage, fetchurl }:
let
  version = "1.95.104";
  hash = "0vj2fsr0c8hdaf85fas099s0fjbw1j1vx828a3k7aky8kwz3r7p0";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.95.104/brave-browser_1.95.104_amd64.deb";
}
