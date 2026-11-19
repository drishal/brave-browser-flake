{ callPackage, fetchurl }:
let
  version = "1.101.52";
  hash = "0l4m7scz06zir74q3b6fk2igf69picrrr3css90789p6zmrw62ds";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-beta";
  inherit version hash;
  url = "https://brave-browser-apt-beta.s3.brave.com/pool/main/b/brave-origin-beta/brave-origin-beta_1.101.52_amd64.deb";
}
