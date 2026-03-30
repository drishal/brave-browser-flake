{ callPackage, fetchurl }:
let
  version = "1.90.80";
  hash = "0i8k6cc68yh77zx9hb6n8h933iha006ql7g5yl0saamasqvb53d0";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}