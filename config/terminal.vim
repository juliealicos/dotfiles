" hide numbers when buffer is terminal
function! InitTerminal()
    setlocal nonumber norelativenumber
endfunction

autocmd TermOpen * call InitTerminal()

" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

tnoremap <Esc> <C-\><C-n>

autocmd! Filetype fzf tunmap <Esc>
    \| autocmd BufLeave <buffer> tnoremap <Esc> <C-\><C-n> \
