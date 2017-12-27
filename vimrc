set number
set foldcolumn=1
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
 
set hlsearch
set smartcase
set ignorecase
set incsearch
nnoremap <ESC> :nohlsearch<CR><ESC>
 
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set wrap
set hidden

syntax on
filetype plugin on
filetype indent on
set nocompatible
set encoding=utf-8
set laststatus=2
 
set noswapfile
set nobackup
set nowritebackup

set ruler
 
set undolevels=1000
set backspace=indent,eol,start

set background=dark
colorscheme archery

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let mapleader = ","

nmap <Leader>, ,
nmap <Leader>r :source $MYVIMRC<CR> :echo "Reloaded vimrc!"<CR>
nmap <Leader>w :w<CR>
map j gj
map k gk
