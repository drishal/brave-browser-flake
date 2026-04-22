{ callPackage, fetchurl }:
let
  version = "1.91.78";
  hash = "1nk3c8g20fsqc0dsh4k1x25ak5vcx2cgr96w9szcilnfghbpasxm";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_${version}_amd64.deb";
}
