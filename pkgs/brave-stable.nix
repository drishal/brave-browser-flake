{ callPackage, fetchurl }:
let
  version = "1.96.58";
  hash = "1mbr829px5w99daxcg8j62488k1fbwi579k9fj1gi0h8901mf5gq";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.96.58/brave-browser_1.96.58_amd64.deb";
}
