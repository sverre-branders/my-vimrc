
function! g:SetTermCols(group, ctermfg, ctermbg)
	let l:attr = get(a:, 1, "")
	let l:guisp = get(a:, 2, "")

	if a:ctermfg != ""
		exec "hi " . a:group . " ctermfg=" . a:ctermfg
	endif
	if a:ctermbg != ""
		exec "hi " . a:group . " ctermbg=" . a:ctermbg
	endif
endfunction
function! g:SetAttr(group, new_attr)
	let l:attr = get(a:, 1, "")
	if l:attr != ""
		exec "hi " . a:group . " gui=" . l:new_attr . " cterm=" . l:new_attr
	endif
endfunction

hi clear
syntax reset

" BASICS
call g:SetTermCols("Normal", g:tWHITE, "")
call g:SetTermCols("Constant", g:tSEC, "")
call g:SetTermCols("NonText", g:tSEC, "")
call g:SetTermCols("Special", g:tMAIN, "")
call g:SetTermCols("Cursor", g:tGREY, g:tWHITE)
call g:SetTermCols("StatusLine", g:tDARKER_GREY, g:tWHITE)
call g:SetTermCols("StatusLineNC", g:tDARKER_GREY, g:tLIGHT_GREY)
call g:SetTermCols("LineNr", g:tDARKER_GREY, "")

call g:SetTermCols("Underlined", g:tSEC, g:tLIGHT_GREY)
call g:SetTermCols("IncSearch", g:tLIGHT_GREY, g:tSEC)
call g:SetTermCols("Search", g:tSEC, g:tLIGHT_GREY)
call g:SetTermCols("MatchParen", g:tMAIN, g:tWHITE)
call g:SetTermCols("ErrorMsg", g:tBLACK, g:tERR)

" WINDOWS, FOLDS & TABS
call g:SetTermCols("VertSplit", g:tDARKER_GREY, g:tGREY)
call g:SetTermCols("Folded", g:tGREY, g:tDARKER_GREY)

call g:SetTermCols("TabLine", g:tWHITE, g:tDARKER_GREY)
call g:SetTermCols("TabLineSel", g:tWHITE, g:tSEC)
call g:SetTermCols("TabLineFill", g:tDARKER_GREY, g:tGREY)

" MENU
call g:SetTermCols("PMenu", g:tWHITE, g:tDARKER_GREY)
call g:SetTermCols("PMenuSel", g:tMAIN, g:tDARKER_GREY)

" SYNTAX HIGHLIGHTING
call g:SetTermCols("Function", g:tMAIN, "")
call g:SetTermCols("Statement", g:tTER, "")
call g:SetTermCols("Operator", g:tTER, "")
call g:SetTermCols("Type", g:tTER, "")
call g:SetTermCols("Title", g:tSEC, "")
call g:SetTermCols("Keyword", g:tSEC, "")
call g:SetTermCols("Include", g:tLIGHT_GREY, "")
call g:SetTermCols("String", g:tSEC, "")
call g:SetTermCols("Constant", g:tLIGHT_GREY, "")
call g:SetTermCols("Define", g:tLIGHT_GREY, "")
call g:SetTermCols("Identifier", g:tLIGHT_GREY, "")
call g:SetTermCols("PreProc", g:tSEC, "")
call g:SetTermCols("Identifier", g:tSEC, "")
call g:SetTermCols("Comment", g:tDARK_GREY, "")
call g:SetTermCols("Conceal", g:tLIGHT_GREY, "")

" SPELLING
call g:SetTermCols("SpellBad", g:tERR, "0")
call g:SetTermCols("SpellLocal", g:tTER, "0")
call g:SetTermCols("SpellCap", g:tTER, "0")
call g:SetTermCols("SpellRare", g:tTER, "0")

" C HIGHLIGHTING
call g:SetTermCols("cPreCondit", g:tTER, "")
call g:SetTermCols("cPreProc", g:tTER, "")
call g:SetTermCols("cDefine", g:tTER, "")

" MARKDOWN HIGHLIGHTING
call g:SetTermCols("markdownLinkText", g:tDARKER_GREY, g:tTER)
