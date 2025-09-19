" most basic settings
set nocompatible
language en_US.UTF-8
set encoding=utf-8
filetype plugin indent on

" enable syntax highlighting
set termguicolors
syntax enable

" use relative and absolute line numbers
set signcolumn=yes
set number
set relativenumber 
set mouse=a
set scrolloff=4

" tab, backspace and wrap settings
set nowrap
set linebreak
set breakindent
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" use smartcase search
set ignorecase smartcase

" use jj to exit insert
inoremap jj <Esc>

" use q for b
nnoremap q b

" user Esc * 2 to exit term
tnoremap <Esc><Esc> <C-\><C-n>

" disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" disable C-f and C-b
" prefer C-d and C-u
nnoremap <C-f> <nop>
nnoremap <C-b> <nop>

" shift modify for fast j-k
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>
vnoremap <S-j> <C-d>
vnoremap <S-k> <C-u>

" ctrl modify for scrolling
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" tab navigation
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" set colorscheme
set background=dark
colorscheme retrobox

" ruler at column 100
set colorcolumn=100
highlight ColorColumn guibg=#303030

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=40
let g:netrw_browse_split=0

" enable spellcheck for latex files
autocmd Filetype tex setlocal spell wrap tabstop=2 shiftwidth=2

" enable spellcheck for text files
autocmd Filetype text setlocal spell tabstop=2 shiftwidth=2

" enable spellcheck for markdown files
autocmd BufRead,BufRead *.md.html setlocal filetype=markdown
autocmd Filetype markdown setlocal spell tabstop=2 shiftwidth=2

" use tab size 2 for (system)verilog
autocmd Filetype verilog setlocal tabstop=2 shiftwidth=2
autocmd Filetype systemverilog setlocal tabstop=2 shiftwidth=2

" use tab size 2 for lua
autocmd Filetype lua setlocal tabstop=2 shiftwidth=2
