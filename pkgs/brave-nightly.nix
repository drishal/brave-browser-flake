{ callPackage, fetchurl }:
let
  version = "1.90.47";
  hash = "098db6gswxy3qwlkzdkvgkgvqx9c78j7h9538y5vicc0a9mvy6nm";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}