" Abbreviations ---- {{{
iabbrev BOX - [ ]
iabbrev BOXX - [x]
" }}}

"  Better TODOs ---- {{{
function! CheckBox()
    let line = getline('.')
    let date = strftime('%d-%m-%y')
    let newline = substitute(line, "- \\[ \\]", "- [x] " . date . "\t", "")
    call setline('.', newline)
endfunction

nnoremap <leader>f :call CheckBox()<CR>
" }}}
