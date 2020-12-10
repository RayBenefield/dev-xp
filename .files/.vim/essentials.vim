"
" Essentials for any of my vim setups
"

" Improves performance of airline
let g:airline_extensions = []

let g:netrw_dirhistmax=0

" Set encoding for file icons
set encoding=UTF-8
set ff=unix

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

" https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
" Easier Tab Navigation
execute "set <C-F>=\e[1;5P"
nnoremap <C-T> :tabe<CR>
nnoremap <C-W> :tabc<CR>
nnoremap <C-[> :tabp<CR>
nnoremap <C-]> :tabn<CR>
nnoremap <C-\> :tabe /mnt/c/Users/RayBenefield/Dropbox/My PC (Ray-PC)/Documents/My Games/CORE/Saved/Maps/<CR>


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

" Smart casing search
set smartcase 

" Where snippets live
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
