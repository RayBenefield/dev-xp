"
" Visual changes to improve readability
"

" Airline Status Line settings
let g:airline_theme = 'dark'
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

" A dark grey for highlighting; rgb=38,38,38
highlight Visual cterm=NONE ctermbg=235 ctermfg=NONE guibg=Grey15

" NERDTree colors
highlight Directory ctermfg=cyan
highlight Number ctermfg=red
highlight Title ctermfg=blue

" Personal Color Scheme
highlight Comment ctermfg=lightblue
highlight Type ctermfg=lightyellow
highlight Statement ctermfg=yellow
highlight PreProc ctermfg=green
highlight String ctermfg=magenta
highlight Type ctermfg=lightyellow
highlight Function ctermfg=cyan
highlight Normal ctermfg=lightgray
highlight LineNr ctermfg=lightgreen
highlight CursorLineNr ctermfg=yellow
highlight Identifier ctermfg=lightcyan
highlight Constant ctermfg=magenta

" Conceal certain patterns in javascript for readability
hi clear Conceal
set conceallevel=1
let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_arrow_function            = "⇒"
let g:javascript_conceal_null                      = "ø"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_return                    = "⏎"
let g:javascript_conceal_noarg_arrow_function      = "⏣"
let g:javascript_conceal_underscore_arrow_function = "⏘"
