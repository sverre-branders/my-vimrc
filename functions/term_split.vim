function! OpenTerm()
    let height = 15
    botright term 
    resize +$height
endfunction

let s:term_in_tab = 0
function! TermWindowInTab()
    for win_info in getwininfo()
        if win_info['terminal'] == 1
            let s:term_in_tab = 1
            break
        else
            let s:term_in_tab = 0
        endif
    endfor
endfunction

function! ToggleTerm()
    call TermWindowInTab()
    if s:term_in_tab
        let term_win = filter(map(getbufinfo(), 'v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')
        if len(term_win) > 0
            execute 'bdelete! ' . term_win[0] 
        endif
    else
        call OpenTerm()
    endif
endfunction

