let $FZF_DEFAULT_COMMAND = 'rg --files -g "!{*.swp,*.bak,*.pyc,*.class,*.o,*.log,*.so,node_modules}"'
let g:fzf_layout = { 'down': '~30%' }

let g:fzf_preview_window = 'right:50%'

" Populate quickfix list with selected files
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  botright copen
  cc
endfunction

autocmd! FileType fzf set noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set ruler rnu nu

" Ctrl-q allows to select multiple elements an open them in quick list
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"""""""""""""""""""""""""" LS """"""""""""""""""""""""""""""""""""""
command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""" LS """"""""""""""""""""""""""""""""""""""
command! -bang -complete=dir -nargs=* LSA
    \ call fzf#run(fzf#wrap({'source': 'ls -a', 'dir': <q-args>}, <bang>0))
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RipgrepFzf(query, fullscreen)
  let initial_command = 'rg
        \ --column
        \ --line-number
        \ --no-heading
        \ --color=always -g "!{*.swp,*.bak,*.pyc,*.class,*.o,*.log,*.so,node_modules}"
        \ --smart-case '.a:query.' || true'
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

command! -nargs=* -bang -complete=dir Rg call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>p :Files<CR><F2>
nnoremap <leader>P :Files!<CR><F2>
nnoremap <leader>b :Buffers<CR><F2>
nnoremap <leader>l :BLines<CR><F2>
nnoremap <leader>L :Lines<CR><F2>
nnoremap <leader>t :BTags<CR><F2>
nnoremap <leader>T :Tags<CR><F2>
