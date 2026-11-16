{ callPackage, fetchurl }:
let
  version = "1.102.10";
  hash = "0lyl7xkfpn8q2qm086x1cjzl84azr4x9pwn4diishifzrxagnx0x";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_1.102.10_amd64.deb";
}
