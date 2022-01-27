" most basic settings
set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax enable
set termguicolors
set splitbelow
set signcolumn=yes

" use relative and absolute line numbers
set number
set relativenumber 
set mouse=a

" tab, backspace and wrap settings
set wrap
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set nofixeol

" use jj to exit insert
inoremap jj <Esc>

" user Esc * 2 to exit term
tnoremap <Esc><Esc> <C-\><C-n>

" disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" tab navigation
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" plugins
call plug#begin('~/.vim/plugged')

" Plug 'ervandew/supertab'

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

let $FZF_DEFAULT_COMMAND='rg --files'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
map <C-p> :Files<CR> 

Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
let g:coc_global_extensions = [
            \'coc-json', 
            \'coc-tsserver',
            \'coc-clangd',
            \'coc-python',
            \'coc-texlab'
            \]

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = '㏇'
let g:airline_symbols.colnr = '℅'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" set colorscheme
set background=dark
colorscheme onedark

" enable spellcheck for latex files
autocmd BufRead,BufNewFile *.tex setlocal spell

" enable spellcheck for markdown files
autocmd BufRead,BufRead *.md.html set filetype=markdown
autocmd Filetype markdown setlocal spell
