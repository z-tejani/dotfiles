" Use Vim settings, rather than Vi settings
set nocompatible

" Define FZF and RG Functions
" Files function
command! -bang -nargs=? -complete=dir Files
  \ call fzf#run(fzf#wrap('files', {
  \   'source': empty(<q-args>)
  \     ? (executable('fd')
  \         ? 'fd --type f --hidden --follow --exclude .git'
  \         : 'find . -type f -not -path "*/.git/*"')
  \     : (executable('fd')
  \         ? 'fd --type f --hidden --follow --exclude .git -- ' . shellescape('') . ' ' . shellescape(<q-args>)
  \         : 'find ' . shellescape(<q-args>) . ' -type f -not -path "*/.git/*"'),
  \   'sink': 'edit',
  \   'options': '--multi --preview "bat --style=numbers --color=always --line-range :300 {} 2>/dev/null || cat {}"'
  \ }, <bang>0))

" History function
function! s:history_source()
  return filter(copy(v:oldfiles), 'filereadable(v:val)')
endfunction

command! -bang History
  \ call fzf#run(fzf#wrap('history', {
  \   'source': s:history_source(),
  \   'sink': 'edit',
  \   'options': '--multi --tiebreak=index'
  \ }, <bang>0))

" Buffers function
function! s:buffer_source()
  let buffers = []
  for bufnr in filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&buftype") == ""')
    let name = bufname(bufnr)
    if empty(name)
      let name = '[No Name]'
    endif
    call add(buffers, printf('%3d  %s', bufnr, name))
  endfor
  return reverse(buffers)
endfunction

function! s:buffer_sink(line)
  let bufnr = str2nr(matchstr(a:line, '^\s*\zs\d\+'))
  if bufnr > 0
    execute 'buffer' bufnr
  endif
endfunction

command! -bang Buffers
  \ call fzf#run(fzf#wrap('buffers', {
  \   'source': s:buffer_source(),
  \   'sink': function('s:buffer_sink'),
  \   'options': '--tiebreak=index --preview "echo {}"'
  \ }, <bang>0))

" Rg Function
function! s:rg_sink(line)
  if empty(a:line)
    return
  endif
  let parts = split(a:line, "\t", 1)
  if len(parts) >= 4
    execute 'edit' fnameescape(parts[0])
    call cursor(str2nr(parts[1]), str2nr(parts[2]))
    normal! zz
  endif
endfunction

command! -bang -nargs=* Rg
  \ call fzf#run(fzf#wrap('rg', {
  \   'source': 'rg --column --line-number --no-heading --color=always --smart-case --field-match-separator "\t" -- ' . shellescape(<q-args>),
  \   'sink': function('s:rg_sink'),
  \   'options': '--ansi --delimiter "\t" --nth 4.. --preview "bat --style=numbers --color=always --highlight-line {2} {1} 2>/dev/null || true"'
  \ }, <bang>0))

" Change Colors
set background=dark
set termguicolors
set scrolloff=8
colorscheme elflord
"set signcolumn=yes
"set colorcolumn=80

" Setup netrw
" Leader key
let mapleader = " "

" Keybinding
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>w :update<CR>
nnoremap <leader>q :close<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>= <C-w>=
set rtp+=/opt/homebrew/opt/fzf
nnoremap <leader>o :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<Space>

" Netrw tweaks
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Enable syntax highlighting and filetype detection
let g:c_functions = 1
let g:c_function_pointers = 1
let g:c_comment_strings = 1
syntax on
filetype plugin indent on
" Remove background coloring
" highlight Normal guibg=NONE ctermbg=NONE

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

filetype plugin indent on
set expandtab
set autoindent      " Copy indent from current line to next
set shiftwidth=4    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
set tabstop=4


set ruler	                " Show row and column ruler information
set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start	" Backspace behavior


" Manually configure theme
" Catppuccin Mocha
set termguicolors
set background=dark

highlight clear
if exists('syntax_on')
  syntax reset
endif

" Editor
highlight Normal       guifg=#cdd6f4 guibg=#1e1e2e gui=NONE
highlight NonText      guifg=#45475a guibg=NONE
highlight EndOfBuffer  guifg=#1e1e2e guibg=NONE
highlight LineNr       guifg=#6c7086 guibg=NONE
highlight CursorLineNr guifg=#cba6f7 guibg=NONE gui=bold
highlight CursorLine   guibg=#181825 gui=NONE
highlight ColorColumn  guibg=#313244
highlight SignColumn   guifg=#cdd6f4 guibg=#1e1e2e
highlight VertSplit    guifg=#45475a guibg=#1e1e2e gui=NONE

" Selection and search
highlight Visual       guibg=#45475a gui=NONE
highlight Search       guifg=#1e1e2e guibg=#f9e2af gui=NONE
highlight IncSearch    guifg=#1e1e2e guibg=#fab387 gui=NONE
highlight CurSearch    guifg=#1e1e2e guibg=#fab387 gui=NONE
highlight MatchParen   guifg=#fab387 guibg=#45475a gui=bold

" Status line and tabs
highlight StatusLine   guifg=#cdd6f4 guibg=#313244 gui=NONE
highlight StatusLineNC guifg=#6c7086 guibg=#181825 gui=NONE
highlight TabLine      guifg=#a6adc8 guibg=#181825 gui=NONE
highlight TabLineSel   guifg=#cba6f7 guibg=#313244 gui=bold
highlight TabLineFill  guibg=#11111b gui=NONE

" Completion menu
highlight Pmenu        guifg=#cdd6f4 guibg=#313244
highlight PmenuSel     guifg=#1e1e2e guibg=#cba6f7 gui=NONE
highlight PmenuSbar    guibg=#45475a
highlight PmenuThumb   guibg=#6c7086

" Syntax
highlight Comment      guifg=#7f849c gui=italic
highlight Constant     guifg=#fab387 gui=NONE
highlight String       guifg=#a6e3a1 gui=NONE
highlight Character    guifg=#94e2d5 gui=NONE
highlight Number       guifg=#fab387 gui=NONE
highlight Boolean      guifg=#fab387 gui=NONE
highlight Float        guifg=#fab387 gui=NONE
highlight Identifier   guifg=#cdd6f4 gui=NONE
highlight Function     guifg=#89b4fa gui=NONE
highlight Statement    guifg=#cba6f7 gui=NONE
highlight Operator     guifg=#89dceb gui=NONE
highlight PreProc      guifg=#f5c2e7 gui=NONE
highlight Type         guifg=#f9e2af gui=NONE
highlight Special      guifg=#f2cdcd gui=NONE
highlight Delimiter    guifg=#9399b2 gui=NONE
highlight Todo         guifg=#1e1e2e guibg=#f9e2af gui=bold

" Messages
highlight Error        guifg=#f38ba8 guibg=NONE gui=NONE
highlight ErrorMsg     guifg=#f38ba8 guibg=NONE gui=NONE
highlight WarningMsg   guifg=#f9e2af guibg=NONE
highlight Directory    guifg=#89b4fa gui=NONE
