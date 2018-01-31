with import <nixpkgs> {};
vim_configurable.customize {
  name = "vim";
  vimrcConfig.customRC = ''
    filetype plugin indent on
    set relativenumber
    set nocompatible
    syntax enable
    " backspace
    set backspace=indent,eol,start
    " nerdtree
    let NERDTreeShowHidden=1
    map <C-n> :NERDTreeToggle<CR>
    '';
  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
  vimrcConfig.vam.pluginDictionaries = [ 
  { 
    names = [ 
      "ctrlp" 
      "nerdtree"
      "YouCompleteMe"
    ]; 
  } 
  ];
}
