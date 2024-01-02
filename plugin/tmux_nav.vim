" Thanks to christoomey https://github.com/christoomey/vim-tmux-navigator/tree/master
" MIT License
"
" Copyright (c) 2017 Chris Toomey
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
" THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
" OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
" ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
" OTHER DEALINGS IN THE SOFTWARE.

let g:loaded_tmux_navigator = 1

" Set Commands ---- {{{
if empty($TMUX)
    command! TmuxNavigateLeft call s:VimNavigate('h')
    command! TmuxNavigateDown call s:VimNavigate('j')
    command! TmuxNavigateUp call s:VimNavigate('k')
    command! TmuxNavigateRight call s:VimNavigate('l')
    command! TmuxNavigatePrevious call s:VimNavigate('p')
finish
endif

command! TmuxNavigateLeft call s:TmuxAwareNavigate('h')
command! TmuxNavigateDown call s:TmuxAwareNavigate('j')
command! TmuxNavigateUp call s:TmuxAwareNavigate('k')
command! TmuxNavigateRight call s:TmuxAwareNavigate('l')
command! TmuxNavigatePrevious call s:TmuxAwareNavigate('p')
" }}}

" Variables ---- {{{
if !exists("g:tmux_navigator_save_on_switch")
  let g:tmux_navigator_save_on_switch = 0
endif

if !exists("g:tmux_navigator_disable_when_zoomed")
  let g:tmux_navigator_disable_when_zoomed = 0
endif

if !exists("g:tmux_navigator_preserve_zoom")
  let g:tmux_navigator_preserve_zoom = 0
endif

if !exists("g:tmux_navigator_no_wrap")
  let g:tmux_navigator_no_wrap = 0
endif
" }}}

" Vim Navigate ---- {{{
function! s:VimNavigate(direction)
    try
        execute 'wincmd ' . a:direction
    catch
        echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
    endtry
endfunction
" }}}

" Tmux Navigate ---- {{{
let s:pane_position_from_direction = {'h': 'left', 'j': 'bottom', 'k': 'top', 'l': 'right'}

function! s:TmuxOrTmateExecutable()
    return (match($TMUX, 'tmate') != -1 ? 'tmate' : 'tmux')
endfunction

function! s:TmuxVimPaneIsZoomed()
    return s:TmuxCommand("display-message -p '#{window_zoomed_flag}'") == 1
endfunction

function! s:TmuxSocket()
    " The socket path is the first value in the comma-separated list of $TMUX.
    return split($TMUX, ',')[0]
endfunction

function! s:TmuxCommand(args)
    let cmd = s:TmuxOrTmateExecutable() . ' -S ' . s:TmuxSocket() . ' ' . a:args
    let l:x=&shellcmdflag
    let &shellcmdflag='-c'
    let retval=system(cmd)
    let &shellcmdflag=l:x
    return retval
endfunction

function! s:TmuxNavigatorProcessList()
    echo s:TmuxCommand("run-shell 'ps -o state= -o comm= -t ''''#{pane_tty}'''''")
endfunction
command! TmuxNavigatorProcessList call s:TmuxNavigatorProcessList()

let s:tmux_is_last_pane = 0
augroup tmux_navigator
    au!
    autocmd WinEnter * let s:tmux_is_last_pane = 0
augroup END

function! s:NeedsVitalityRedraw()
    return exists('g:loaded_vitality') && v:version < 704 && !has("patch481")
endfunction

function! s:ShouldForwardNavigationBackToTmux(tmux_last_pane, at_tab_page_edge)
  if g:tmux_navigator_disable_when_zoomed && s:TmuxVimPaneIsZoomed()
    return 0
  endif
  return a:tmux_last_pane || a:at_tab_page_edge
endfunction

function! s:TmuxAwareNavigate(direction)
    let nr = winnr()
    let tmux_last_pane = (a:direction == 'p' && s:tmux_is_last_pane)
    if !tmux_last_pane
        call s:VimNavigate(a:direction)
    endif
    let at_tab_page_edge = (nr == winnr())
    " Forward the switch panes command to tmux if:
    " a) we're toggling between the last tmux pane;
    " b) we tried switching windows in vim but it didn't have effect.
    if s:ShouldForwardNavigationBackToTmux(tmux_last_pane, at_tab_page_edge)
        if g:tmux_navigator_save_on_switch == 1
            try
                update " save the active buffer. See :help update
            catch /^Vim\%((\a\+)\)\=:E32/ " catches the no file name error
            endtry
        elseif g:tmux_navigator_save_on_switch == 2
            try
                wall " save all the buffers. See :help wall
            catch /^Vim\%((\a\+)\)\=:E141/ " catches the no file name error
            endtry
        endif

        let args = 'select-pane -t ' . shellescape($TMUX_PANE) . ' -' . tr(a:direction, 'phjkl', 'lLDUR')
        if g:tmux_navigator_preserve_zoom == 1
            let l:args .= ' -Z'
        endif

        if g:tmux_navigator_no_wrap == 1
            let args = 'if -F "#{pane_at_' . s:pane_position_from_direction[a:direction] . '}" "" "' . args . '"'
        endif

        silent call s:TmuxCommand(args)
        if s:NeedsVitalityRedraw()
            redraw!
        endif
        let s:tmux_is_last_pane = 1
    else
        let s:tmux_is_last_pane = 0
    endif
endfunction
" }}}
