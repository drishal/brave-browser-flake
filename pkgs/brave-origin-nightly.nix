{ callPackage, fetchurl }:
let
  version = "1.101.40";
  hash = "1d90rjl52rbqvad5lwaksrsjgyxyhjk7p66a0dxdcasls63xybnv";
in
callPackage ./build-brave.nix { } {
  pname = "brave-origin-nightly";
  inherit version hash;
  url = "https://brave-browser-apt-nightly.s3.brave.com/pool/main/b/brave-origin-nightly/brave-origin-nightly_1.101.40_amd64.deb";
}
