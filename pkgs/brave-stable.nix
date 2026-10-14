{ callPackage, fetchurl }:
let
  version = "1.97.57";
  hash = "1fbbq7wk570gmr8hqspkv95hqwsqk6ksyhdn458wysd85al1k6fp";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.97.57/brave-browser_1.97.57_amd64.deb";
}
