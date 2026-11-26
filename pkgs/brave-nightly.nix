{ callPackage, fetchurl }:
let
  version = "1.102.42";
  hash = "0ficm17346wq404h2g85p8dn4zck4lagpx061d7pqcl8jhzpala7";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v1.102.42/brave-browser-nightly_1.102.42_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}