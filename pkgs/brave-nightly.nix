{ callPackage, fetchurl }:
let
  version = "1.90.24";
  hash = "0isdsml5nzsg56qp7wsisfhys07y2842hgdv2prwcjmhmdccr5da";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}