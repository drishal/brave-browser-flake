{ callPackage, fetchurl }:
let
  version = "1.99.55";
  hash = "13f876am41s21q9fc5bx23kllg47slls45z2w2imnkfq5959akin";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.99.55/brave-browser_1.99.55_amd64.deb";
}
