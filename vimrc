let g:vim_dir = fnameescape(resolve($HOME . '/.vim/'))
execute "set runtimepath+=" . '"' . g:vim_dir . '"'
filetype plugin on

runtime general_config.vim
runtime lsp_config.vim
runtime colors/color_definitions.vim
colorscheme theme
runtime colors/statusline.vim
runtime colors/tabline.vim

