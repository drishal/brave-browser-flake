{ callPackage, fetchurl }:
let
  version = "1.102.26";
  hash = "0jsa91122203mi05mffnpxds46x1jhbg1l9p9z62ppihz7gx77mp";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.102.26/brave-browser-nightly_1.102.26_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}