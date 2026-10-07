{ callPackage, fetchurl }:
let
  version = "1.97.56";
  hash = "0sdnjf4xzsh2vdmhr1i2gr8m0qkxl4873ayszkk6f19qvf4wpr1h";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.97.56/brave-browser_1.97.56_amd64.deb";
}
