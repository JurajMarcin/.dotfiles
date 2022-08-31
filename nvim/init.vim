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
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'honza/vim-snippets'
Plug 'NLKNguyen/papercolor-theme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" apiblueprint
Plug 'kylef/apiblueprint.vim'

" c
Plug 'ludwig/split-manpage.vim'

" haskell
Plug 'dag/vim2hs'

" python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" tex
Plug 'lervag/vimtex'

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
set titlestring=%F

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

" coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" c
autocmd FileType c setlocal tabstop=8 shiftwidth=8 noexpandtab textwidth=80
autocmd FileType cpp setlocal tabstop=8 shiftwidth=8 noexpandtab textwidth=80
autocmd FileType kconfig setlocal tabstop=8 shiftwidth=8 noexpandtab textwidth=80
autocmd FileType make setlocal tabstop=8 shiftwidth=8 noexpandtab textwidth=80

" LaTeX
autocmd FileType tex setlocal textwidth=80

" haskell
let g:haskell_conceal_wide = 0
let g:haskell_multiline_strings = 1

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
        \ colorcolumn=79 formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

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

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
