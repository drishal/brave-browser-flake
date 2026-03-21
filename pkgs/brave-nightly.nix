{ callPackage, fetchurl }:
let
  version = "1.90.54";
  hash = "16hr582bm61wcm562xbhsqfnvxwns2l6sq2jbyz5l82g3hbgpk7v";
in
callPackage ./build-brave.nix { } {
  pname = "brave-nightly";
  inherit version hash;
  url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
  commandLineArgs = "--enable-features=BraveAIChatAgentProfile";
}