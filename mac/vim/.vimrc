" Use Vim settings, rather than Vi settings
set nocompatible

" Change Colors
colorscheme evening
set background=dark
set termguicolors

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
