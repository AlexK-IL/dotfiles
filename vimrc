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

" Plugins
"-------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'othree/html5-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-eunuch'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'sirver/UltiSnips'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1

" Powerline
let g:powerline_pycmd="py3"
let g:Powerline_symbols = 'fancy'
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Theming
syntax enable
set background=dark
colorscheme solarized

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
" let g:ycm_server_python_interpreter='/usr/bin/python2'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" use jshint
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NERDTree on startup
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

" GUI options
"------------
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
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
let venv_path = $VIRTUAL_ENV
if !empty(venv_path)
    let g:ycm_python_binary_path = venv_path . '/bin/python'
    let g:ycm_python_interpreter_path = venv_path . '/bin/python'
else
    let g:ycm_python_binary_path = 'python'
endif

" Client side
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Custom key mappings
"--------------------

nnoremap <silent> <ESC> :nohlsearch<CR><ESC>
" Go through split rows
map j gj
map k gk
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Custom leader combinations
"---------------------------

let mapleader = ","

nmap <Leader>, ,
nmap <Leader>rr :source $MYVIMRC<CR> :echo "Reloaded vimrc!"<CR>
nmap <Leader>re :e $MYVIMRC<CR>
nmap <Leader>w :w<CR>
nmap <Leader>W :w!!<CR>
nmap <Leader>q :q<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>f :Files<CR>
" split navigations
nnoremap <Leader>j <C-W><C-J> " go to right pane
nnoremap <Leader>k <C-W><C-K> " go to upper  pane
nnoremap <Leader>l <C-W><C-L> " go to lower pane
nnoremap <Leader>h <C-W><C-H> " go to left pane
" buffers
nnoremap <Leader>x :bd<CR> " close current buffer
nnoremap <Leader>n :bn<CR> " next buffer
nnoremap <Leader>p :bp<CR> " previous buffer
" toggle nerdtree file explorer
nnoremap <Leader>o :NERDTreeToggle<CR>
" toggle paste mode
nnoremap <Leader>tp :set paste!<CR>
" execute current py script
au BufNewFile,BufRead *.py nnoremap <buffer> <Leader>e :exec '!python' shellescape(@%, 1)<CR>

"" Local customizations
"---------------------

"" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

