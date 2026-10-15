{ callPackage, fetchurl }:
let
  version = "1.100.1";
  hash = "0n53l7dih3nqc2lx53zfv369x4j8k4vs1a46r8c551ir3l78gl9c";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.100.1/brave-browser-nightly_1.100.1_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}