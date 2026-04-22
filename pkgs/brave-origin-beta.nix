{ callPackage, fetchurl }:
let
  version = "1.91.87";
  hash = "1aiiswbna7sal64k4vp3xkk84wv5q9syzpipyfl62726ay07msb5";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-beta";
  inherit version hash;
  url = "https://brave-browser-apt-beta.s3.brave.com/pool/main/b/brave-origin-beta/brave-origin-beta_${version}_amd64.deb";
}
