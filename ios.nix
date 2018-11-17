with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "ios";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    cocoapods
    fastlane
  ];
}
