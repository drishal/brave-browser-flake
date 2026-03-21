{ callPackage, fetchurl }:
let
  version = "1.89.119";
  hash = "0vqs6hfyv3alxnry2sws35wy65v6cfzrbmd5qs6r6wcxvn7n98nd";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}