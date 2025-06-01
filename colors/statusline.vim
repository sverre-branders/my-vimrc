" echo "LOADING NEW STATUSLINE"

execute 'hi StatusLineBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tWHITE

execute 'hi StatusNormalBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tDARKER_GREY
execute 'hi StatusNormal ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tWHITE
execute 'hi StatusNormalBGI ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tBLACK

execute 'hi StatusInsert ctermbg=' . g:tSEC . ' ctermfg=' . g:tWHITE
execute 'hi StatusInsertBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tSEC
execute 'hi StatusInsertFG ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tSEC

execute 'hi StatusReplace ctermbg=' . g:tERR . ' ctermfg=' . g:tWHITE
execute 'hi StatusReplaceBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tERR
execute 'hi StatusReplaceFG ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tERR

execute 'hi StatusVisual ctermbg=' . g:tTER . ' ctermfg=' . g:tDARKER_GREY
execute 'hi StatusVisualBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tTER
execute 'hi StatusVisualFG ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tTER

execute 'hi StatusSelect ctermbg=' . g:tGREY . ' ctermfg=' . g:tTER
execute 'hi StatusSelectBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tGREY
execute 'hi StatusSelectFG ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tGREY

execute 'hi StatusCommand ctermbg=' . g:tLIGHT_GREY . ' ctermfg=' . g:tDARKER_GREY
execute 'hi StatusCommandBG ctermbg=' . g:tBLACK . ' ctermfg=' . g:tLIGHT_GREY
execute 'hi StatusCommandFG ctermbg=' . g:tDARKER_GREY . ' ctermfg=' . g:tLIGHT_GREY

execute 'hi StatusComment ctermbg=' . g:tBLACK . ' ctermfg=' . g:tDARKER_GREY

set laststatus=2
set noshowmode

set statusline=
" NORMAL MODE
set statusline+=%#StatusNormalBG#%{(mode()=='n')?'':''}
set statusline+=%#StatusNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#StatusNormal#%{(mode()=='n')?'':''}
" INSERT MODE
set statusline+=%#StatusInsertBG#%{(mode()=='i')?'':''}
set statusline+=%#StatusInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#StatusInsertFG#%{(mode()=='i')?'':''}
" REPLACE MODE
set statusline+=%#StatusReplaceBG#%{(mode()=='R')?'':''}
set statusline+=%#StatusReplace#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#StatusReplaceFG#%{(mode()=='R')?'':''}
" VISUAL REPLACE MODE
set statusline+=%#StatusReplaceBG#%{(mode()=='Rv')?'':''}
set statusline+=%#StatusReplace#%{(mode()=='Rv')?'\ \ VISUAL-REPLACE\ ':''}
set statusline+=%#StatusReplaceFG#%{(mode()=='Rv')?'':''}
" VISUAL MODE
set statusline+=%#StatusVisualBG#%{(mode()=='v')?'':''}
set statusline+=%#StatusVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#StatusVisualFG#%{(mode()=='v')?'':''}
" VISUAL LINE MODE
set statusline+=%#StatusVisualBG#%{(mode()=='V')?'':''}
set statusline+=%#StatusVisual#%{(mode()=='V')?'\ \ VISUAL-LINE\ ':''}
set statusline+=%#StatusVisualFG#%{(mode()=='V')?'':''}
"
set statusline+=%#StatusVisualBG#%{(mode()=='\<C-V>')?'':''}
set statusline+=%#StatusVisual#%{(mode()=='\<C-V>')?'\ \ VISUAL-LINE\ ':''}
set statusline+=%#StatusVisualFG#%{(mode()=='\<C-V>')?'':''}
" SELECT
set statusline+=%#StatusSelectBG#%{(mode()=='s')?'':''}
set statusline+=%#StatusSelect#%{(mode()=='s')?'\ \ SELECT\ ':''}
set statusline+=%#StatusSelectFG#%{(mode()=='s')?'':''}

set statusline+=%#StatusSelectBG#%{(mode()=='S')?'':''}
set statusline+=%#StatusSelect#%{(mode()=='S')?'\ \ SELECT-LINE\ ':''}
set statusline+=%#StatusSelectFG#%{(mode()=='S')?'':''}

set statusline+=%#StatusSelectBG#%{(mode()=='\<C-S>')?'':''}
set statusline+=%#StatusSelect#%{(mode()=='\<C-S>')?'\ \ SELECT-BLOCK\ ':''}
set statusline+=%#StatusSelectFG#%{(mode()=='\<C-S>')?'':''}
" COMMAND
set statusline+=%#StatusCommandBG#%{(mode()=='c')?'':''}
set statusline+=%#StatusCommand#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#StatusCommandFG#%{(mode()=='c')?'':''}

set statusline+=%#StatusNormal#
set statusline+=\ %t\ %m " file name + modified
set statusline+=%#StatusNormalBG#
set statusline+=%=%#StatusComment#\[\ %<%{getcwd()}\ \]
set statusline+=%#StatusNormal#\ %l:%-c\ \ %y " modified + line and column nr + file type
set statusline+=\ %#StatusNormalBG#

