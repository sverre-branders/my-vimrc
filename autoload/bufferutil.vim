function! bufferutil#RunInShellAndReloadBuffer(command)
    " echom "RunInShellAndReloadBuffer called with: " . a:command

    let popup_id = popup_create('Running command: ' . a:command, #{line: 5, col: 5})

    let result = systemlist(a:command)
    let exit_status = v:shell_error

    call popup_close(popup_id)

    if exit_status == 0
        echo 'Command success'
        " Reload the buffer
        edit!
    else
        echo 'Command failed with exit status: ' . exit_status
    endif
endfunction
