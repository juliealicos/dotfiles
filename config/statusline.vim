" Vanila status line config
let g:currentmode={
      \ 'n'          : 'N',
      \ 'v'          : 'V',
      \ 'V'          : 'VL',
      \ "\<C-V>"     : 'VB',
      \ 'i'          : 'I',
      \ 'R'          : 'R',
      \ 'Rv'         : 'RV',
      \ 'c'          : 'C',
      \ 't'          : 'T',
      \}
"
hi NormalColor          guifg=Black         guibg=#50fa7b
hi InsertColor          guifg=Black         guibg=#8be9fd
hi ReplaceColor         guifg=Black         guibg=#ff79c6
hi VisualColor          guifg=Black         guibg=#ffb86c
hi TerminalColor        guifg=Black         guibg=#bd93f9
hi User1                guifg=White         guibg=#44475a
hi User2                guifg=White         guibg=#44788E
hi User3                guifg=White         guibg=#6272a4
hi User4                guifg=White         guibg=#bd93f9
hi User5                guifg=White         guibg=#5b7fbb
hi User6                guifg=White         guibg=#810085
" hi StatusLineNc         guifg=White         guibg=#44475a
"

function! SetActiveStatusLine()
    let s:statusLine="%#NormalColor#%{(g:currentmode[mode()]=='N')?'\ \ NORMAL\ ':''}
                \%#InsertColor#%{(g:currentmode[mode()]=='I')?'\ \ INSERT\ ':''}
                \%#ReplaceColor#%{(g:currentmode[mode()]=='R')?'\ \ REPLACE\ ':''}
                \%#replacecolor#%{(g:currentmode[mode()]=='Rv')?'\ \ V-REPLACE\ ':''}
                \%#VisualColor#%{(g:currentmode[mode()]=='V')?'\ \ VISUAL\ ':''}
                \%#VisualColor#%{(g:currentmode[mode()]=='VL')?'\ \ V-LINE\ ':''}
                \%#VisualColor#%{(g:currentmode[mode()]=='VB')?'\ \ V-BLOCK\ ':''}
                \%#NormalColor#%{(g:currentmode[mode()]=='C')?'\ \ COMMAND\ ':''}
                \%#TerminalColor#%{(g:currentmode[mode()]=='T')?'\ \ TERMINAL\ ':''}
                \%#PmenuSel#
                \%#Statusline#
                \%1*\ %<%F \
                \%m%r%w \
                \%=
                \%2*\ %y \
                \%2*\ %{''.(&fenc!=''?&fenc:&enc).''} \
                \%3*\ %{&ff} \
                \%5*\ row:%l/%L \
                \%4*\ col:%c \ "
    return s:statusLine
endfunction

function! SetInactiveStatusLine()
    let s:statusLine="\%#Statusline#
                \%1*\ %<%F \
                \%m%r%w \
                \%=
                \%{''.(&fenc!=''?&fenc:&enc).''} \
                \% row:%l/%L \
                \% col:%c \ "
    return s:statusLine
endfunction

" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction

augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!SetActiveStatusLine()
    au WinLeave,BufLeave * setlocal statusline=%!SetInactiveStatusLine()
    au WinEnter,BufEnter NvimTree setlocal statusline=%3*\<Explorer>
    au WinLeave,BufLeave NvimTree setlocal statusline=<Explorer>
augroup END
