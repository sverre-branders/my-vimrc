let g:skip_bash_check = 0

augroup BashCheckOnSave
    autocmd!
    autocmd BufWritePost <buffer> if !g:skip_bash_check | call tmuxutil#RunCommandInShellPane('bash -n ' . expand('%')) | endif
augroup END
