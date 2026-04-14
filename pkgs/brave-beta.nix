{ callPackage, fetchurl }:
let
  version = "1.90.103";
  hash = "0lj963s8ka9z9wih04lnxqp66l1pp807il5ih0mwaxqwl84x32ma";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}