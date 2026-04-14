{ callPackage, fetchurl }:
let
  version = "1.91.43";
  hash = "00mk24gr5mrrp8r93ki406q68n9r79g1s7s0v7vq19srb6jczdiv";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}