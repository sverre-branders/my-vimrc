function! tmuxutil#RunCommandInNextPane(command)
    " echom "RunCommandInNextPane called with: " . a:command

    " Check if we're in a tmux session
    if empty($TMUX)
        " Not in a tmux session
        return
    endif

    " Check if tmux windows exist
    let l:tmux_panes = system('tmux list-panes')

    if l:tmux_panes =~ '^\s*\d\+'
        " Switch to the next pane
        call system('tmux select-pane -t :.+' )

        " Send the command to the active pane
        call system('tmux send-keys "' . a:command . '" C-m')
    else
        " No pane to switch to
        return
    endif
endfunction

function! tmuxutil#RunCommandInShellPane(command)
    " Check if we're in a tmux session
    if empty($TMUX)
        " Not in a tmux session
        return
    endif

    " Get the current pane ID
    let l:current_pane = system('tmux display-message -p "#{pane_id}"')

    " List all panes and find one running a shell like bash
    let l:tmux_panes = system('tmux list-panes -F "#{pane_id} #{pane_current_command}"')
    let l:shell_pane = ''

    for l:line in split(l:tmux_panes, "\n")
        if l:line =~ 'bash\|zsh\|sh'
            let l:shell_pane = matchstr(l:line, '^\S\+')
            break
        endif
    endfor

    if l:shell_pane != ''
        " Switch to the shell pane
        call system('tmux select-pane -t ' . l:shell_pane)

        call system('tmux send-keys C-u') " Clear the current line
        call system('tmux send-keys "' . a:command . '" C-m') " Send the command

        " Return to the original pane
        call system('tmux select-pane -t ' . l:current_pane)
    else
        " No shell pane found
        return
    endif
endfunction
