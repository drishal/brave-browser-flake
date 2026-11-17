{ callPackage, fetchurl }:
let
  version = "1.101.50";
  hash = "0iijg9iiv3cfbl6aiabx74ica543k0v7hrc7n37b9fc5l6hrgccn";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-beta";
  inherit version hash;
  url = "https://brave-browser-apt-beta.s3.brave.com/pool/main/b/brave-origin-beta/brave-origin-beta_1.101.50_amd64.deb";
}
