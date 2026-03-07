{ callPackage, fetchurl }:
let
  version = "1.90.9";
  hash = "0rn3za6wmfcav9c0ay3x3yx9dky4n148q9y346y3qcsm8w2m12wy";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}