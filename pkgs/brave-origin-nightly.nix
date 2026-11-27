{ callPackage, fetchurl }:
let
  version = "1.102.46";
  hash = "04nm0a2yyqi0jdz5ib9a2c7pzh77qdfclfsvh9qn9f0fqf2z2a9s";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_1.102.46_amd64.deb";
}
