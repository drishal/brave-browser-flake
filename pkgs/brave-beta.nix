{ callPackage, fetchurl }:
let
  version = "1.90.105";
  hash = "1y3wnvv8y5kk838csvcmhz7jxx9rc6qfm18kjspyl2ammrhlcqzs";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}