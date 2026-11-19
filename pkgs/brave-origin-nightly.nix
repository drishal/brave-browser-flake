{ callPackage, fetchurl }:
let
  version = "1.102.22";
  hash = "0wpgygjawy8hvnlc9fv1mq74p81pgklhk1bq6p859m1khsp2dv18";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_1.102.22_amd64.deb";
}
