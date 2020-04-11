let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"

" Do not use default status line
set noshowmode

" Do not use powerline arrows, it looks not serious
let g:airline_powerline_fonts = 0

let g:airline_skip_empty_sections = 1

" Do not show spell language indicator, show only spell/nospell
let g:airline_detect_spelllang=0

" Disable some icons in lune number section_z to reduce length
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.space=' '
let s:spc = g:airline_symbols.space

