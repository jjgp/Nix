with (import <nixpkgs> {});

let
  gems = bundlerEnv {
    name = "<name>-gems";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };

in stdenv.mkDerivation {
  name = "<name>";
  buildInputs = [gems ruby];
}
