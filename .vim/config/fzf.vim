let $FZF_DEFAULT_COMMAND = 'rg --files -g "!{*.swp,*.bak,*.pyc,*.class,*.o,*.log,*.so,node_modules}"'
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_preview_window = 'right:50%'

" Populate quickfix list with selected files
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  botright copen
  cc
endfunction

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
    let command_fmt = 'rg --column --line-number --no-heading --color=always -g "!{*.swp,*.bak,*.pyc,*.class,*.o,*.log,*.so,node_modules}" --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>p :Files<CR>
nnoremap <leader>P :Files!<CR>
nnoremap <leader>b :Buffers<CR>
