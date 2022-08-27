call plug#begin('~/.vim/plugged')
    Plug 'sheerun/vim-polyglot' " Better Syntax Support
    Plug 'scrooloose/NERDTree' " File Explorer
    "Color theme
    Plug 'morhetz/gruvbox' 
    Plug 'joshdick/onedark.vim'
    Plug 'mbbill/undotree'
    Plug 'vim-airline/vim-airline' " Show mode bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-syntastic/syntastic' " Syntax checker
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete plugin
    Plug 'alvan/vim-closetag' " Close tag
    Plug 'tpope/vim-surround' " Surround selection
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive' " Git support plugin for vim 
    Plug 'rbong/vim-flog'
    "Fuzzy finder 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
    Plug 'junegunn/fzf.vim'
    Plug  'easymotion/vim-easymotion'
call plug#end()
