{ callPackage, fetchurl }:
let
  version = "1.93.131";
  hash = "07yk5m3l9yyqrri14mvk0xw60djmywzy1vadh0qwn84imjg824lj";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.93.131/brave-browser_1.93.131_amd64.deb";
}
