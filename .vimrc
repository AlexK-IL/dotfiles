"--------
" GENERAL
"--------

" Don't create swap files
set noswapfile

" Encode files as utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1255

" Allow backspace to delete indentaion and lines
set backspace=indent,eol,start

" Set line numbers
set number

" Set syntax highlighting on
syntax enable

" Don't be compatible with vi
set nocompatible

" Indentation settings
set expandtab " Expand tabs as spaces
set shiftwidth=2 " Set indenting as 2 spaces
set softtabstop=2 " Set tab keystrokes as 2 spaces
set autoindent " Auto indent where possible
" Indentaion based on file types (~/.vim/after/ftplugin)
filetype plugin indent on

" Search settings
set ignorecase " Ignore case when searching
set smartcase " Don't ignore case when search is uppercased
" Highlight search while typing
set hlsearch
set incsearch
set showmatch

" Line wrapping settings
set wrap " wrap lines when longer than the screen
set cursorline " Set line indicator where the cursor is
set colorcolumn=90 " Highlight max column
" To use format options, comment format options set by default on file:
" /usr/share/vim/vim74/ftplugin/vim.vim
" Disable inserting comments on new lines
set formatoptions-=ro

"---------
" KEY MAPS
"---------

" Set leaderkey
let mapleader = " "

" Remap escape key to clear highlights
noremap <silent> <esc> <esc>:nohlsearch<CR>

" Remap j,k keys to go over columns and not over lines
noremap j gj
noremap k gk

" Map keys for moving through buffers
noremap <Leader>p :bprevious<CR>
noremap <Leader>n :bnext<CR>
