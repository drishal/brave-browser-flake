{ callPackage, fetchurl }:
let
  version = "1.101.55";
  hash = "09ghshb56kr86s3drzb9k01zj0lqsx480ch8x9vm264w17kxrnwy";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-beta";
  inherit version hash;
  url = "https://brave-browser-apt-beta.s3.brave.com/pool/main/b/brave-origin-beta/brave-origin-beta_1.101.55_amd64.deb";
}
