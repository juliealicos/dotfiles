" FZF

let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = ['right:60%']
let $FZF_DEFAULT_COMMAND = 'rg --files'

let $FZF_DEFAULT_OPTS="--bind 
    \ctrl-y:preview-up,
    \ctrl-e:preview-down,
    \ctrl-b:preview-page-up,
    \ctrl-f:preview-page-down,
    \ctrl-u:preview-half-page-up,
    \ctrl-d:preview-half-page-down,
    \ctrl-a:toggle-all,
    \ctrl-x:toggle,
    \F2:toggle-preview"


" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

autocmd! Filetype fzf tunmap <Esc>
    \| autocmd BufLeave <buffer> tnoremap <Esc> <C-\><C-n>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>f<space> :FzfFiles<space>
nnoremap <leader>bb :FzfBuffers<CR>
nnoremap <leader>s :RG<CR>
nnoremap <leader>m :FzfMarks<CR>
