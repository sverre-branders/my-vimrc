let maplocalleader="Ø"
" Namespaces ---- {{{
inoreabbrev <expr> ss 'std::' . nr2char(getchar(0)) . "\<Left>"
set cindent

execute "highlight C_NAMESPACE ctermfg=" . g:tGREY
autocmd BufWinEnter * match C_NAMESPACE /std::/
autocmd InsertEnter * match C_NAMESPACE /std::/
autocmd InsertLeave * match C_NAMESPACE /std::/
" }}}

" Commenting ---- {{{
vnoremap <LocalLeader>c :s/\%V\(.*\)/\/\* \1 \*\//<CR>
" }}}

" AutoComplete ---- {{{
    " Prevents searching all included files
set complete-=i
" }}}

" View Assembly ---- {{{
function! ViewAssembly(...)
    " echom "ViewAssembly"
    let l:optimize_opt = a:0 >= 1 ? a:1 : ''

    if empty($TMUX)
        return
    endif

    let l:gxx_options = '-S -fverbose-asm -fno-asynchronous-unwind-tables '
            \ . '-fno-dwarf2-cfi-asm -masm=intel ' 
            \ . l:optimize_opt

    let l:cmd = 'tmux split-window "g++ ' . l:gxx_options . ' -o - % | vim -"'

    " echom 'w !' . l:cmd
    silent! execute 'w !' . l:cmd
endfunction
" }}}

" OverWrite mappings ---- {{{
noremap <leader>a :w<CR>:call system("tmux send-keys -t + 'make' Enter")<CR>
noremap <leader>s :call ViewAssembly()<CR>

if executable('clang-format')
    noremap <leader>e :w<CR>:call bufferutil#RunInShellAndReloadBuffer('clang-format ' . shellescape(expand('%')) . ' -i -style=Microsoft')<CR>
endif
if executable('clang-tidy')
    augroup CxxTidyOnSave
        autocmd!
        autocmd BufWritePost <buffer> call tmuxutil#RunCommandInShellPane('make lint file=' . shellescape(expand('%')))
    augroup END
else
    echom "Consider installing 'clang-tidy'"
endif
" }}}
"
