call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

" Useful pair-like features that utilize square brackets
" 	IE: ]<Space> = Create new line below
Plug 'tpope/vim-unimpaired'

call plug#end()

" Automatically re-source vimrc when a *.vim file is saved
augroup filetype_vim
    autocmd!
    autocmd BufWritePost *.vim :source $MYVIMRC
augroup END

" Change leader to the home row
let mapleader = ";"

" Toggle NERDTree
nmap <LEADER>n :NERDTreeToggle<CR>
