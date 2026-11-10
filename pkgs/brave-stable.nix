{ callPackage, fetchurl }:
let
  version = "1.99.56";
  hash = "0wmw70zqczri35rv1f9lrc7sjxrr42pikcbw5glfb3vm138z8njv";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.99.56/brave-browser_1.99.56_amd64.deb";
}
