" Plugins

call plug#begin('~/.local/share/nvim/plugged/')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Basic setup

set mouse=a

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Visual settings

syntax on
set ruler
set number relativenumber
set colorcolumn=+0,+20

let no_buffers_menu=1

" Better command line completion
set wildmenu

set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

set background=dark
colorscheme PaperColor
let g:rehash256 = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm'
        set term=xterm-256color
    endif
endif

if &term =~ '256color'
  set t_ut=
endif

set title
set titleold="Terminal"
" set titlestring="%F"

" vim-airline
let g:airline_theme = 'papercolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

" Nerdtree
map <C-n> :NERDTreeFocus<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Switching buffers
noremap <A-PageUp> :bprev<CR>
noremap <A-PageDown> :bnext<CR>

set nocp

" webdev
autocmd FileType typescriptreact setlocal textwidth=100
autocmd FileType javascript setlocal textwidth=100
autocmd FileType javascript-1 setlocal textwidth=100
autocmd FileType javascript-2 setlocal textwidth=100
autocmd FileType javascriptreact setlocal textwidth=100
autocmd FileType jsx setlocal textwidth=100
autocmd FileType jsx_pretty setlocal textwidth=100
autocmd FileType tsx setlocal textwidth=100
autocmd FileType typescript setlocal textwidth=100
autocmd FileType typescriptcommon setlocal textwidth=100
autocmd FileType vue setlocal textwidth=100
