{ callPackage, fetchurl }:
let
  version = "1.102.18";
  hash = "13k2icjqw61n6i89awpxqhjhrb0xyan3pb8sxnkg0wx4kxbxg36c";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_1.102.18_amd64.deb";
}
