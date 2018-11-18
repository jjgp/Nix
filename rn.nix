/* To start a new app:
   npx react-native-cli init AwesomeProject */

with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "react-native";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    nodejs
    watchman
  ];
}
