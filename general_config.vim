" Vim script Folding ---- {{{
augroup vim_fold
    autocmd!
    autocmd FileType vim,tmux setlocal foldmethod=marker
    autocmd FileType vim,tmux setlocal foldlevel=1
augroup END
" }}}

" General Config ---- {{{ 
syntax enable
execute "filetype plugin indent on"
set number
set hlsearch " Highlighted search
set incsearch
set showmatch " Matching parentices
set path=.,,**
set clipboard=unnamedplus " set default copy\paste to use "+, this allows copy paste between buffers if vim has clipboard-enabled
    " autocmd FileType * set fileformat=unix
    " autocmd FileType * set encoding=utf-8  " The encoding displayed.
    " autocmd FileType * set fileencoding=utf-8  " The encoding written to file.
" }}}

" General Mapping ---- {{{
nnoremap Q å
noremap ø :
tnoremap ø <C-w>:
nnoremap <space> za
xnoremap n :norm
vnoremap n :norm
nnoremap <leader>v :setl nu!<CR>
" }}}

" Tabs and Spaces ---- {{{
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=multispace:\ \ \ ▕ " This shows indentation guides
" }}}

" Leader mappings ---- {{{
let mapleader="Ø"
noremap <leader>s :source $MYVIMRC<CR>:echo "Reloaded vimrc"<CR>
noremap <leader>v :setl nu!<CR>
" }}}

" Tmux integration ---- {{{
nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :<C-U>TmuxNavigatePrevious<CR>

noremap <leader>r :call system('tmux send-keys -t .+ -l ' . shellescape(join([getline("."), "\n"])) )<CR>
noremap <leader>a :call system('tmux send-keys -t .+ -l ' . shellescape(join(getline(1, '$'), "\n") . "\n") )<CR>
" visual mode requires a new function
vnoremap <leader>r :<c-u>call TmuxSendVisual(visualmode())<cr>

function! TmuxSendVisual(type)
    let save_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let escaped_text = escape(@@, '\')
    call system("! tmux send-keys -t .+ -l " . shellescape(join([escaped_text, "\n"])) )

    let @@ = save_register
endfunction
" }}}

" File tree ---- {{{
let g:netrw_keepdir = 1
let g:netrw_banner = 0
nnoremap <C-o> <Esc>:lcd %:p:h<CR>:Lex<CR>:vertical resize<CR>
inoremap <C-o> <Esc>:lcd %:p:h<CR>:Lex<CR>:vertical resize<CR>
autocmd FileType netrw nnoremap <buffer> <C-o> <Esc>:Lex<CR>

" New bindings
autocmd FileType netrw nmap <buffer> l <CR>
autocmd FileType netrw nmap <buffer> h -^
autocmd FileType netrw nnoremap <buffer> t <Esc>:call OpenInTmuxPane()<CR>

function! OpenInTmuxPane()
    let selected_path = netrw#Call('NetrwFile', netrw#Call('NetrwGetWord'))
    Lex
    call system('tmux split-window -h "vim ' . shellescape(selected_path) . '"')
    call system("tmux select-layout tiled")
endfunction

" TODO: tabfind in a popup
" }}}

" Completion ---- {{{
set omnifunc=syntaxcomplete#Complete
" }}}
