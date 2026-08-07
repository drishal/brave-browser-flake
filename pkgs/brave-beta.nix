{ callPackage, fetchurl }:
let
  version = "1.94.104";
  hash = "0dqmbbfclvgl0b8rzva6wydggi0gwr7jmbkgsc13fs1x842z239x";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.94.104/brave-browser-beta_1.94.104_amd64.deb";
}