{ callPackage, fetchurl }:
let
  version = "1.91.1";
  hash = "11sy0ppi52n9ffxyqknnmvd9p33hy8fqzlc3j4h9fvdsydiakhmq";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}