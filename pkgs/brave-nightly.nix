{ callPackage, fetchurl }:
let
  version = "1.90.79";
  hash = "0px8f79z5fjq0ssr2mhwn1mdl5wrdsahg3kwalg9yhch2p25p1rw";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}