{ callPackage, fetchurl }:
let
  version = "1.91.92";
  hash = "02fbj1klzaqfhwg3bxkqb6b97wjrs7rcsp5z226zharhhd7yp630";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}