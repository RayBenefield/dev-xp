"
" Essentials for any of my vim setups
"

" Home row escape key
inoremap jk <ESC>
inoremap jK <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
vnoremap JK <ESC>

" Easier Split Navigation
nnoremap <C-J> <C-W><C-J>  " Down
nnoremap <C-K> <C-W><C-K>  " Up
nnoremap <C-L> <C-W><C-L>  " Right
nnoremap <C-H> <C-W><C-H>  " Left

" Set leader key to something on the home row
let mapleader = ";"

" Set backspace to work as it should
set backspace=indent,eol,start

" Sets a unified shared clipboard between yank and the OS
set clipboard=unnamed,unnamedplus

" Enables syntax highlighting
syntax enable

" Color the line that the cursor is on
set cursorline
highlight CursorLine cterm=UNDERLINE ctermbg=234

" Show uncomplete commands in the bottom right
set showcmd

" Set indentation level
set tabstop=4
set shiftwidth=4
set expandtab

" Set line width
set tw=80

" Don't wrap long lines (soft wrap)
set nowrap
