{ callPackage, fetchurl }:
let
  version = "1.97.53";
  hash = "1gs8vg32pd8kkfj3nac87ajq74gjxprp1cxpas3jbcmz36cb0nl3";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.97.53/brave-browser_1.97.53_amd64.deb";
}
