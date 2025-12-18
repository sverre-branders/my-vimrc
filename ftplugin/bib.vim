setlocal textwidth=80
setlocal shiftwidth=2
setlocal tabstop=4
setlocal expandtab

if executable('bibtool')
    noremap <leader>e :w<CR>:call bufferutil#RunInShellAndReloadBuffer('bibtool -o ' . shellescape(expand('%')) . ' ' . shellescape(expand('%')) . ' -- "print.line.length {80}" -s')<CR>:retab<CR>:w<CR>
else
    echom "Consider installing 'bibtool'"
endif

:command! CheckValid match ErrorMsg /[^\x00-\x7F]/
