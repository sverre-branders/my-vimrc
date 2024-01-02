" Vim script Folding ---- {{{
augroup vim_fold
    autocmd!
    autocmd FileType vim,tmux setlocal foldmethod=marker
    autocmd FileType vim,tmux setlocal foldlevel=1
augroup END
" }}}

" General Config ---- {{{ 
augroup general_config
    autocmd!
    autocmd VimEnter * syntax enable
    autocmd FileType * execute "filetype plugin on"
    autocmd FileType * set number
    autocmd FileType * set tabstop=4
    autocmd FileType * set shiftwidth=4
    autocmd FileType * set expandtab
    autocmd FileType * set smarttab
    autocmd FileType * set autoindent
    autocmd FileType * set cindent
    autocmd FileType * set hlsearch " Highlighted search
    autocmd FileType * set incsearch
    autocmd FileType * set showmatch " Matching parentices
    " autocmd FileType * set fileformat=unix
    " autocmd FileType * set encoding=utf-8  " The encoding displayed.
    " autocmd FileType * set fileencoding=utf-8  " The encoding written to file.
augroup END
" }}}

" General Mapping ---- {{{
augroup general_mapping
    autocmd!
    autocmd FileType * nnoremap Q å
    autocmd FileType * noremap ø :
    autocmd FileType * tnoremap ø <C-w>:
    autocmd FileType * nnoremap <space> za
    autocmd FileType * xnoremap n :norm
    autocmd FileType * vnoremap n :norm
    autocmd FileType * nnoremap <leader>v :setl nu!<CR>
augroup END
" }}}

" Leader mappings ---- {{{
let mapleader="Ø"
augroup leader_mappings
    autocmd!
    autocmd FileType * noremap <leader>s :source $MYVIMRC<CR>
    autocmd FileType * noremap <leader>v :setl nu!<CR>
    autocmd FileType * noremap <leader>r :call system('tmux send-keys -t .+ -l ' . shellescape(join([getline("."), "\n"])) )<CR>
    autocmd FileType * noremap <leader>a :call system('tmux send-keys -t .+ -l ' . shellescape(join(getline(1, '$'), "\n") . "\n") )<CR>
augroup END
" }}}

" Tmux integration ---- {{{
augroup tmux_integration
    autocmd!
    autocmd FileType * nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<CR>
    autocmd FileType * nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<CR>
    autocmd FileType * nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<CR>
    autocmd FileType * nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<CR>
    autocmd FileType * nnoremap <silent> <C-\> :<C-U>TmuxNavigatePrevious<CR>
augroup END
" }}}

" File tree ---- {{{
" }}}
