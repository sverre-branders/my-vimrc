" echo "LOADING NEW STATUSLINE"

execute 'hi StatusLineBG ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tWHITE
execute 'hi StatusNormal ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tWHITE
execute 'hi StatusInsert ctermbg=' . g:tSEC . ' ctermfg=' . g:tWHITE
execute 'hi StatusReplace ctermbg=' . g:tERR . ' ctermfg=' . g:tWHITE
execute 'hi StatusVisual ctermbg=' . g:tTER . ' ctermfg=' . g:tDARKER_GREY
execute 'hi StatusSelect ctermbg=' . g:tGREY . ' ctermfg=' . g:tTER
execute 'hi StatusCommand ctermbg=' . g:tLIGHT_GREY . ' ctermfg=' . g:tDARKER_GREY
execute 'hi StatusComment ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tDARK_GREY

set laststatus=2

set statusline=
set statusline+=%#StatusNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#StatusInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#StatusReplace#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#StatusReplace#%{(mode()=='Rv')?'\ \ VISUAL-REPLACE\ ':''}
set statusline+=%#StatusVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#StatusVisual#%{(mode()=='V')?'\ \ VISUAL-LINE\ ':''}
set statusline+=%#StatusVisual#%{(mode()=='\<C-V>')?'\ \ VISUAL-LINE\ ':''}
set statusline+=%#StatusSelect#%{(mode()=='s')?'\ \ SELECT\ ':''}
set statusline+=%#StatusSelect#%{(mode()=='S')?'\ \ SELECT-LINE\ ':''}
set statusline+=%#StatusSelect#%{(mode()=='\<C-S>')?'\ \ SELECT-BLOCK\ ':''}
set statusline+=%#StatusCommand#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#StatusNormal#
set statusline+=\ %t\ %m " file name + modified
set statusline+=%=%#StatusComment#\[\ %<%{getcwd()}\ \]
set statusline+=%#StatusLineBG#\ \ \ \ %3l:%-3c\ %y " modified + line and column nr + file type

