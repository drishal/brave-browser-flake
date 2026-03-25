{ callPackage, fetchurl }:
let
  version = "1.90.64";
  hash = "1bcps88qmdhd4g1khkcnpcb2vkm9j331dx5n4pyn7li6i7by77q1";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}