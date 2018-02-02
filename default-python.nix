# For reference: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.md
# This is an attempt to install dependencies including matplotlib
# Matplotlib failed requiring CoreFoundation/CFAttributedString

with import <nixpkgs> {};
with pkgs.python27Packages;

stdenv.mkDerivation {
  name = "cs6601-assignment-2";
  buildInputs = [
    # these packages are required for virtualenv and pip to work:
    #
    python27Full
    python27Packages.virtualenv
    python27Packages.pip
    # the following packages are related to the dependencies of your python
    # project.
    # In this particular example the python modules listed in the
    # requirements.tx require the following packages to be installed locally
    # in order to compile any binary extensions they may require.
    #
    darwin.apple_sdk.frameworks.Accelerate
    darwin.apple_sdk.frameworks.Cocoa
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.cf-private
    clangStdenv
    freetype
    libpng12
    pkgconfig
    python27Packages.numpy
  ];
  src = null;
  shellHook = ''
  # set SOURCE_DATE_EPOCH so that we can use python wheels
  SOURCE_DATE_EPOCH=$(date +%s)
  virtualenv venv
  export PATH=$PWD/venv/bin:$PATH
  export CFLAGS="-I ${darwin.cf-private} $CFLAGS"
  pip install -r requirements.txt
  '';
}
