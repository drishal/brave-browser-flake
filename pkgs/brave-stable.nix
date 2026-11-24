{ callPackage, fetchurl }:
let
  version = "1.100.59";
  hash = "0qbqn7f0zrrd871ci0hcdjipsmb2a26id35afjfsfx39qmbr5wpg";
in
callPackage ./build-brave.nix { } {
  pname = "brave-stable";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.100.59/brave-browser_1.100.59_amd64.deb";
}
