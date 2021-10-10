" Polyglot
" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" Plugins

call plug#begin('~/.local/share/nvim/plugged/')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'honza/vim-snippets'
Plug 'kylef/apiblueprint.vim'
Plug 'tomasr/molokai'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

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

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

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
set number
set colorcolumn=+0

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

colorscheme molokai
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

" vim-airline
let g:airline_theme = 'molokai'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Ale
let g:ale_linters = {'python': ['mypy', 'flake8']}
let g:python_mypy_options = '--strict'
highlight ALEError ctermbg=DarkMagenta
highlight ALEWarning ctermbg=DarkYellow
highlight ALEInfo ctermbg=DarkBlue

call ale#Set('c_clangtidy_options', '-std=c99')

" Vimtex
let g:tex_flavor = 'latex'

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

set nocp

" c
autocmd FileType c setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd FileType cpp setlocal tabstop=8 shiftwidth=8 noexpandtab

" LaTeX
autocmd FileType tex setlocal colorcolumn=80 textwidth=80
