{ callPackage, fetchurl }:
let
  version = "1.102.46";
  hash = "1vq49fmr5s87gdi59z89i35g9rb38sdjvx7bmcczbbgsi7sr5pks";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.102.46/brave-browser-nightly_1.102.46_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}