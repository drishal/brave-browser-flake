{ callPackage, fetchurl }:
let
  version = "1.102.30";
  hash = "11gc8lk9mk9zxxc3iin22lhnwnh36zmr9vhljcfqxgldrnmghzl1";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.102.30/brave-browser-nightly_1.102.30_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}