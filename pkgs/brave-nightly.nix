{ callPackage, fetchurl }:
let
  version = "1.91.61";
  hash = "1iksq3fxbw130jkczpzppmfyfqrd81pm4sa5a5bg6j3870j85xj8";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}