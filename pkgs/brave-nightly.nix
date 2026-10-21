{ callPackage, fetchurl }:
let
  version = "1.100.20";
  hash = "1zyycmfszw8maj2ys27rspnnbabwvivc59kzbdrrxq1gvwlagd8l";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.100.20/brave-browser-nightly_1.100.20_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}