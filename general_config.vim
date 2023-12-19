" Vim script Folding ---- {{{
augroup vim_fold
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" General Config ---- {{{ 
augroup general_config
    autocmd!
    autocmd VimEnter * syntax enable
    autocmd FileType * set number
    autocmd FileType * set tabstop=4
    autocmd FileType * set shiftwidth=4
    autocmd FileType * set textwidth=79
    autocmd FileType * set expandtab
    autocmd FileType * set smarttab
    autocmd FileType * set smartindent
    autocmd FileType * set cindent
    autocmd FileType * set hlsearch " Highlighted search
    autocmd FileType * set incsearch
    autocmd FileType * set fileformat=unix
    autocmd FileType * set encoding=utf-8  " The encoding displayed.
    autocmd FileType * set fileencoding=utf-8  " The encoding written to file.
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
augroup END
" }}}

" Tabs & Windows ---- {{{
augroup tabs_windows
    autocmd!
    autocmd FileType * noremap  <C-m> <Esc>:tabn<CR>
    autocmd FileType * noremap  <C-n> <Esc>:tabp<CR>
    autocmd FileType * noremap <C-l> <C-w>w
    autocmd FileType * tnoremap <C-l> <C-w>w
    autocmd FileType * noremap <C-h> <C-w>p
    autocmd FileType * tnoremap <C-h> <C-w>p
augroup END
" }}}

" Toggle Terminal ---- {{{
augroup toggle_terminal
    autocmd!
    autocmd FileType * execute "source " .  fnameescape(g:vim_dir . '/functions/term_split.vim')
    autocmd FileType * noremap <C-t> :call ToggleTerm()<CR>
    autocmd FileType * tnoremap <C-t> <C-w>:call ToggleTerm()<CR>
augroup END
" }}}

" File tree ---- {{{
augroup file_tree
    autocmd!
    autocmd FileType * inoremap <C-o> <Esc>:Lex<cr>:vertical resize 50<CR>
    autocmd FileType * nnoremap <C-o> <Esc>:Lex<cr>:vertical resize 50<CR>
    autocmd FileType * autocmd FileType netrw noremap <buffer> <C-l> :Lex<CR>
    autocmd FileType * autocmd FileType netrw nmap <buffer> l <CR>
    autocmd FileType * autocmd FileType netrw nmap <buffer> h -
    autocmd FileType * set path=.,,**
    autocmd FileType * noremap <C-f> <Esc>:tabfind<Space>
augroup END
" }}}

" Leader mappings ---- {{{
augroup leader_mappings
    autocmd!
    autocmd FileType * let mapleader = "Ø"
    autocmd FileType * noremap <leader>s :source $MYVIMRC<CR>
augroup END
" }}}

