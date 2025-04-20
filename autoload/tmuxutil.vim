function! tmuxutil#RunCommandInNextPane(command)
    " echom "RunCommandInNextPane called with: " . a:command

    " Check if we're in a tmux session
    if empty($TMUX)
        return " Not in a tmux session
    endif

    " Check if tmux windows exist
    let l:tmux_panes = system('tmux list-panes')

    if l:tmux_panes =~ '^\s*\d\+'
        " Switch to the next pane
        call system('tmux select-pane -t :.+' )

        " Send the command to the active pane
        call system('tmux send-keys "' . a:command . '" C-m')
    else
        return " No pane to switch to
    endif
endfunction
