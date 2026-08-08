{ callPackage, fetchurl }:
let
  version = "1.93.134";
  hash = "1yi2c51jq8x1rs4lkwbn4df0hsmlkr3wf40215l9yl65296705xs";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.93.134/brave-browser_1.93.134_amd64.deb";
}
