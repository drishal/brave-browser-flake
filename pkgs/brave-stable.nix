{ callPackage, fetchurl }:
let
  version = "1.96.60";
  hash = "12waba86bg86dc8v6cdsbk2yjdxazdibjs46kckzvcqzk6dlf08h";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.96.60/brave-browser_1.96.60_amd64.deb";
}
