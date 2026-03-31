{ callPackage, fetchurl }:
let
  version = "1.90.84";
  hash = "1kbdqjmybxaf5dzbdnkax8rs0j3k1glw04kw76avg6dv6pd3v15x";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}