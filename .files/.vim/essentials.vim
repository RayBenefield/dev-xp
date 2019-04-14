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
