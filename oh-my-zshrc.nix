with import <nixpkgs> {};

pkgs.writeText "zshrc" ''
ZSH_THEME="theunraveler"
export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels"
source $ZSH/oh-my-zsh.sh
source ~/.nix-profile/etc/profile.d/*.sh
plugins=(git tmux)
''
