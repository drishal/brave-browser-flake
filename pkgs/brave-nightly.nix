{ callPackage, fetchurl }:
let
  version = "1.102.14";
  hash = "1l9g1lmcdxis5lxlk3wfxn77wabszp36x904cn9rwqdicmklncpz";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.102.14/brave-browser-nightly_1.102.14_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}