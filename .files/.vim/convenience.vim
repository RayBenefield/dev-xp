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

" Incrementally highlights the results of a search
set incsearch

" Fuzzy File finding settings
let g:ctrlp_map = '<LEADER>p'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'git ls'

" Find current file in NerdTree
nnoremap <LEADER>f :NERDTreeFind<CR>
