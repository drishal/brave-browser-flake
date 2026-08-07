{ callPackage, fetchurl }:
let
  version = "1.95.49";
  hash = "00cddg0i0qf542wkk29y94n1x1aq231ryxdq70hmavn04267mdpb";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.95.49/brave-browser-nightly_1.95.49_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}