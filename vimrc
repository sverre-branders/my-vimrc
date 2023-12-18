let g:vim_dir = resolve($HOME . '/.vim/')
" echo "Sourcing configuration from " . g:vim_dir
execute "source " . fnameescape(g:vim_dir . 'general_config.vim')

execute "source " .  fnameescape(g:vim_dir . '/colors/color_definitions.vim')
colorscheme theme
execute "source " .  fnameescape(g:vim_dir . '/colors/statusline.vim')

