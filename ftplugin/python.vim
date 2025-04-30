" Run file with python in other pane
let g:skip_ruff_check = 0
" Run python without ruff check
noremap <leader>a :let g:skip_ruff_check = 1<CR>:w<CR>:let g:skip_ruff_check = 0<CR>:call tmuxutil#RunCommandInShellPane('python ' . shellescape(expand('%')))<CR>

" Run ruff check on save, only if ruff is installed
if executable('ruff')
    " echom "Found Ruff executable"
    augroup PythonRuffOnSave
        autocmd!
        autocmd BufWritePost <buffer> if !g:skip_ruff_check | call tmuxutil#RunCommandInShellPane('ruff check ' . expand('%')) | endif
    " format the current file using ruff and reload the buffer
    " TODO: reload the buffer after ruff format is completed (:e)
    noremap <leader>e :let g:skip_ruff_check = 1<CR>:w<CR>:let g:skip_ruff_check = 0<CR>:call bufferutil#RunInShellAndReloadBuffer('ruff format ' . shellescape(expand('%')))<CR>
    augroup END
else
    echom "Consider installing ruff 'pip install ruff'"
endif
