{ callPackage, fetchurl }:
let
  version = "1.89.142";
  hash = "1vs4cmkq3crpxn4jllvkvwh68qw13vb8cpqabdnpww46sz7aiivy";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser_${version}_amd64.deb";
}
