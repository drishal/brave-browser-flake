{ callPackage, fetchurl }:
let
  version = "1.99.1";
  hash = "1phkxsk80fv8ajfi1s4ss3r25f78syq8mcw0g0200cc0a45b7iz6";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.99.1/brave-browser-nightly_1.99.1_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}