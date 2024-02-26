function! SendToNextPane()
    " Check if python is running in the next pane
    let python_running = system("tmux display-message -p -t .+ '#{pane_current_command}'") =~# 'python'
    if python_running
        call system('tmux send-keys -t .+ -l ' . shellescape(join(getline(1, '$'), "\n") . "\n"))
    else
        let current_file = shellescape(expand('%:p'))
        silent! w
        call system('tmux send-keys -t .+ "python ' . current_file . '" Enter')
    endif
endfunction

noremap <leader>a :call SendToNextPane()<CR>

