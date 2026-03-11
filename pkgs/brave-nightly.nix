{ callPackage, fetchurl }:
let
  version = "1.90.18";
  hash = "1cnb2p95i8wc06r8gcmxb642xxgknl3b1wvjf0r1hpwf8p4pyvvd";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}