{ callPackage, fetchurl }:
let
  version = "1.89.124";
  hash = "0pmn3f2lnp9jln6w993pchrqlw8gc7cyarqar6mxk7sncjfpccba";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}