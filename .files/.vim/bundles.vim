if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Side file drawer
Plug 'scrooloose/nerdtree'

" Useful pair-like features that utilize square brackets
" 	IE: ]<Space> = Create new line below
Plug 'tpope/vim-unimpaired'

" Statusline with Powerline font
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Enables Git features directly in Vim
Plug 'tpope/vim-fugitive'

" Shows a git diff in the gutter (sign column), allows staging/reverting/navigating of hunks
Plug 'airblade/vim-gitgutter'

" Useful pair-like features that utilize square brackets []
Plug 'scrooloose/syntastic'

" Better javascript syntax highlighting
Plug 'pangloss/vim-javascript'

" Adds JS Prettier support
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Add fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'

" Typescript/JSX syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Focus mode for things like creating script outlines
Plug 'junegunn/goyo.vim'

" Comment management
Plug 'tpope/vim-commentary'

" Snippets
Plug 'SirVer/ultisnips'

" Add filetype icons to relevant locations
" IMPORTANT: Must always be last, and requires patching font... see readme
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Automatically re-source vimrc when a *.vim file is saved
augroup filetype_vim
    autocmd!
    autocmd BufWritePost *.vim :source $MYVIMRC
augroup END
