with import <nixpkgs> {};

pkgs.writeText "oh-my-zshrc" ''
ZSH_THEME="theunraveler"
export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
source $ZSH/oh-my-zsh.sh
source ${pkgs.autojump}/share/autojump/autojump.zsh
plugins=(git tmux)
alias c="clear"
alias up="cd .."
alias fuxcode="rm -rf ~/Library/Developer/Xcode/DerivedData"
export CONDA="$HOME/miniconda2/bin"
export PATH="$CONDA:$PATH"
''
