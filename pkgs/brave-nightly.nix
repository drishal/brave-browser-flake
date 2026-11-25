{ callPackage, fetchurl }:
let
  version = "1.102.38";
  hash = "06swf2wrza65i1v4pr3hdg9047mh5c0wdpg6m7cij3bhcryjqxpi";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.102.38/brave-browser-nightly_1.102.38_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}