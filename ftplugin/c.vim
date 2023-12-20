let maplocalleader="Ø"
" Namespaces ---- {{{
inoreabbrev <expr> ss 'std::' . nr2char(getchar(0)) . "\<Left>"

execute "highlight C_NAMESPACE ctermfg=" . g:tGREY
autocmd BufWinEnter * match C_NAMESPACE /std::/
autocmd InsertEnter * match C_NAMESPACE /std::/
autocmd InsertLeave * match C_NAMESPACE /std::/
" }}}

" Commenting ---- {{{
vnoremap <LocalLeader>c :s/\%V\(.*\)/\/\* \1 \*\//<CR>
" }}}

