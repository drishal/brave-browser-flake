{ callPackage, fetchurl }:
let
  version = "1.91.10";
  hash = "0f1jpz8ly0dcgcjm0lxvf339zk2mni8npiligxmx61d1nhz7i3aa";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}