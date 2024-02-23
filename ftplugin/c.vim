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
"
" OverWrite mappings ---- {{{
noremap <leader>a :call system("tmux send-keys -t + 'make' Enter")<CR>
" }}}
