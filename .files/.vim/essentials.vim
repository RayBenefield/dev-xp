"
" Essentials for any of my vim setups
"

" Improves performance of airline
let g:airline_extensions = []

let g:netrw_dirhistmax=0

" Set encoding for file icons
set encoding=UTF-8

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

" Toggle NERDTree
nmap <LEADER>n :NERDTreeToggle<CR>

" Enables syntax highlighting
syntax enable

nnoremap <F5> :source $MYVIMRC<CR>

" Disable arrow movement, resize splits instead.
let g:elite_mode=1
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif
