{ callPackage, fetchurl }:
let
  version = "1.96.55";
  hash = "1gkxcz0kcmrfqrqa1x78rr51fqdwv6bdp7vznb37wygjh0spzi06";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.96.55/brave-browser_1.96.55_amd64.deb";
}
