function! s:goyo_enter()
  set noshowcmd
  set wrap
  set sidescroll=0
  set textwidth=80
endfunction

function! s:goyo_leave()
  set showcmd
  set nowrap
  set sidescroll=1
  set textwidth=0
endfunction

let g:goyo_width = 82

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
