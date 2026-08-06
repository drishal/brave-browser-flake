{ callPackage, fetchurl }:
let
  version = "1.93.132";
  hash = "19c61djr02blf4l5iqbjnnrqg7nyn0xlfbgvjc5dxx98kfac3rgw";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.93.132/brave-browser_1.93.132_amd64.deb";
}
