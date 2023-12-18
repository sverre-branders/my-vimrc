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
tnoremap  <C-m> <C-w>:tabn<CR>
noremap  <C-n> <Esc>:tabp<CR>
tnoremap  <C-n> <C-w>:tabp<CR>
map <C-l> <C-w>w
tmap <C-l> <C-w>w
map <C-h> <C-w>p
tmap <C-h> <C-w>p

" Leader mappings
let mapleader = "Ø"
noremap <leader>s :source $MYVIMRC<CR>
