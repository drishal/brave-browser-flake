{ callPackage, fetchurl }:
let
  version = "1.90.95";
  hash = "011z3xa3swmj93s0xb34prxd6jphxn213sdb033bzfzm28na2vjh";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}