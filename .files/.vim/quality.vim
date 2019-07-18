"
" Keep things clear of clutter and errors
"

" Turn off swap files
set noswapfile

" Disable backup files
set nobackup

" Set a designated Swap file directory
set directory=~/.vim/swap//

" Enable undo files and set a designated directory
set undodir=~/.vim/undo//

" Set indentation level
set tabstop=4
set shiftwidth=4
set expandtab

" Set line width
set tw=80

" Don't wrap long lines (soft wrap)
set nowrap

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_markdown_checkers = ['eslint']
"let g:syntastic_markdown_eslint_args = '--config dx/eslint.config.js'
"let g:syntastic_filetype_map = { "markdown": "javascript" }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--config dx/eslint.config.js'
let g:syntastic_quiet_messages = { "!level":  "error" }

" Prettier Settings
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.vue,*.md  PrettierAsync
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'
