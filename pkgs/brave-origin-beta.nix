{ callPackage, fetchurl }:
let
  version = "1.100.52";
  hash = "15b05mgk10zcq1g8m4ynwbjkksvfjfky4llsq31jcr053rfaksw8";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-beta";
  inherit version hash;
  url = "https://brave-browser-apt-beta.s3.brave.com/pool/main/b/brave-origin-beta/brave-origin-beta_1.100.52_amd64.deb";
}
