let g:vim_dir = fnameescape(resolve($HOME . '/.vim/'))
execute "set runtimepath+=" . '"' . g:vim_dir . '"'

runtime general_config.vim
runtime colors/color_definitions.vim
colorscheme theme
runtime colors/statusline.vim
runtime colors/tabline.vim

