" Use Vim settings, rather than Vi settings
set nocompatible

" Change Colors
colorscheme elflord
set background=dark
set termguicolors
set scrolloff=8
"set signcolumn=yes
"set colorcolumn=80

" Setup netrw
" Leader key
let mapleader = " "

" Keybinding
nnoremap <leader>e :Lexplore<CR>

" Netrw tweaks
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Enable syntax highlighting and filetype detection
syntax on
filetype plugin indent on

" Use UTF-8 encoding
set encoding=utf-8

" Set Relative Line Nums
set relativenumber
set number

" Center Cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Add Splits Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

set hidden	    " Allow switching buffers
set hlsearch        " Highlight all search matches
set incsearch       " Show matches as you type
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless the search contains a capital letter

set autoindent      " Copy indent from current line to next
set shiftwidth=4    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab


set ruler	    " Show row and column ruler information
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
