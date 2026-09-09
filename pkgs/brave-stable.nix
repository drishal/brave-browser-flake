{ callPackage, fetchurl }:
let
  version = "1.95.99";
  hash = "1a2nsxczaancsvj00wl2mxwnm9qcfbw63ps151wa229kf0wh604h";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.95.99/brave-browser_1.95.99_amd64.deb";
}
