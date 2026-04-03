{ callPackage, fetchurl }:
let
  version = "1.91.7";
  hash = "1ykiddh07ddskwa1p1n2az1r3kqcbv1i3w9fqz4ikr26vka035hl";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}