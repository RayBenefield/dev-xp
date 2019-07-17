"
" Minor tweaks that make Vim more seamless
"

" Move up a line even through word wrap
nnoremap j gj
nnoremap k gk

" Ignores the casing when searching
set smartcase

" Always show hidden files with NerdTree
let NERDTreeShowHidden=1

" Color the line that the cursor is on
set cursorline
highlight CursorLine cterm=UNDERLINE ctermbg=234

" Show uncomplete commands in the bottom right
set showcmd
