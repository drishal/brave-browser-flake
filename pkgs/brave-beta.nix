{ callPackage, fetchurl }:
let
  version = "1.98.47";
  hash = "0h2mrssqsg5pfs6idxyvfpfjcl1kpj1c9ayl03znl33hs7wpcn9f";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.98.47/brave-browser-beta_1.98.47_amd64.deb";
}