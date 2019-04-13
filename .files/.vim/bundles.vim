call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

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
