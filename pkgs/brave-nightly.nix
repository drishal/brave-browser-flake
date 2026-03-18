{ callPackage, fetchurl }:
let
  version = "1.90.43";
  hash = "098fqdsbigsi4wb50pjfcr58hfkxp60p2i2cqwsl1mi7hcyv95r6";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}