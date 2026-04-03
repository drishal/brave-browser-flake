{ callPackage, fetchurl }:
let
  version = "1.90.94";
  hash = "0pdndr67khs53gpggcm16kk8vkafivwpfskdkvpzi6sk2fab3981";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}