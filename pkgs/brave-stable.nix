{ callPackage, fetchurl }:
let
  version = "1.97.59";
  hash = "1rcv6hljpp04syxgx9rgv6nf4m48nwblkcy9npxq8chacixq2vv6";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.97.59/brave-browser_1.97.59_amd64.deb";
}
