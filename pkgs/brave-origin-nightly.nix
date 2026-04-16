{ callPackage, fetchurl }:
let
  version = "1.91.63";
  hash = "18g3ngzkpjwcqp8ndhgczrdwlkh5855hcpkh9mlxzr43p0d98hzb";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_${version}_amd64.deb";
}
