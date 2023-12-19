syntax on
set number
set tabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" General
nnoremap Q å
noremap ø :
tnoremap ø <C-w>:
nnoremap <space> za
xnoremap n :norm
vnoremap n :norm

" Tabs & Windows
noremap  <C-m> <Esc>:tabn<CR>
" tnoremap  <C-m> <C-w>:tabn<CR>
noremap  <C-n> <Esc>:tabp<CR>
" tnoremap  <C-n> <C-w>:tabp<CR>
noremap <C-l> <C-w>w
tnoremap <C-l> <C-w>w
noremap <C-h> <C-w>p
tnoremap <C-h> <C-w>p
" Toggle terminal
execute "source " .  fnameescape(g:vim_dir . '/functions/term_split.vim')
noremap <C-t> :call ToggleTerm()<CR>
tnoremap <C-t> <C-w>:call ToggleTerm()<CR>

" File tree
inoremap <C-o> <Esc>:Lex<cr>:vertical resize 50<CR>
nnoremap <C-o> <Esc>:Lex<cr>:vertical resize 50<CR>
autocmd FileType netrw noremap <buffer> <C-l> :Lex<CR>
autocmd FileType netrw nmap <buffer> l <CR>
autocmd FileType netrw nmap <buffer> h -

" Find file
set path=.,,**
noremap <C-f> <Esc>:tabfind<Space>

" Leader mappings
let mapleader = "Ø"
noremap <leader>s :source $MYVIMRC<CR>

