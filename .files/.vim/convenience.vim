"
" Minor tweaks that make Vim more seamless
"

" Move up a line even through word wrap
nnoremap j gj
nnoremap k gk

" Format document
nnoremap g= gg=G``

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
let g:ctrlp_prompt_mappings = {
    \'AcceptSelection("e")': ['<cr>'],
    \'AcceptSelection("h")': ['<c-s>'],
    \'AcceptSelection("t")': ['<c-t>'],
    \'AcceptSelection("v")': ['<c-n>'],
    \'PrtHistory(-1)':       ['<c-=>'],
\}

" Find current file in NerdTree
nnoremap <LEADER>f :NERDTreeFind<CR>

" Autoreload AutoHotkey files on save
augroup ahkfiles
    autocmd!
    autocmd BufWritePost *.ahk call ReloadScript()
augroup END

function ReloadScript()
    let l:ahk = 'timeout 1s "/mnt/c/Program Files/AutoHotkey/AutoHotkey.exe" /r'
    let l:filepath = expand("%:p")

    if l:filepath !~ '^fugitive' && l:filepath !~ '.*/Lib/.*'
        silent execute "!" . l:ahk . " " . l:filepath
        redraw!
    endif
endfunction

nnoremap <leader>j :GitGutterNextHunk<CR>
nnoremap <leader>k :GitGutterPrevHunk<CR>
