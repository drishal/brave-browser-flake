{ callPackage, fetchurl }:
let
  version = "1.90.11";
  hash = "1f4naf45bsfvqbckajflfx94fngp9bg0w3bv14w93q4z4j2plzv6";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}