"
" Visual changes to improve readability
"

" Airline Status Line settings
let g:airline_theme='dark'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Color the line that the cursor is on
set cursorline
highlight CursorLine cterm=UNDERLINE ctermbg=234

" Show uncomplete commands in the bottom right
set showcmd

" Always show the status line
set laststatus=2

" Set relative numbering for better navigation
" with the current line number
set relativenumber
set number
