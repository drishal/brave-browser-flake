{ callPackage, fetchurl }:
let
  version = "1.89.117";
  hash = "1hm5b16w9rc66hy3sjylb7g3f3x3jr0nybr8lnyhmck437fkkrz5";
in
callPackage ./build-brave.nix { } {
  pname = "brave-beta";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-beta_${version}_amd64.deb";
}