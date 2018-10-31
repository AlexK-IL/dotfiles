" General
"--------
" Lines
set ruler
set number
set foldcolumn=1
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
 
" Searching
set hlsearch
set smartcase
set ignorecase
set incsearch

" Folding
set foldmethod=indent
set foldlevel=99
 
" Indentation
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set wrap
set hidden

" Syntax
syntax on
filetype plugin on
filetype indent on
set nocompatible
set encoding=utf-8
set laststatus=2
set formatoptions-=cro
 
" Swap files
set noswapfile
set nobackup
set nowritebackup

" Undos
set undolevels=1000
set backspace=indent,eol,start

" Theming
set background=dark

" Plugins
"-------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plug '/usr/bin/fzf'
"Plug 'junegunn/fzf.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1

" SimplyFold
let g:SimpylFold_docstring_preview=1

" Super tab
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter='/usr/bin/python2'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" GUI options
"------------
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    colorscheme solarized
endif

" File specific
"-------------

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Client side
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

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
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" split navigations
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>n :NERDTreeToggle<CR>

"" Local customizations
"---------------------

"" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
