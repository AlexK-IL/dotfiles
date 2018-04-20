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

" GUI options
"------------

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Custom key mappings
"--------------------

nnoremap <ESC> :nohlsearch<CR><ESC>
" Go through split rows
map j gj
map k gk
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Custom leader combinations
"---------------------------

let mapleader = ","

nmap <Leader>, ,
nmap <Leader>r :source $MYVIMRC<CR> :echo "Reloaded vimrc!"<CR>
nmap <Leader>w :w<CR>
nmap <Leader>W :w!!<CR>

"" Local customizations
"---------------------

"" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
