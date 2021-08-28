" delete != cut

nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
  nnoremap <leader>d "+d
  nnoremap <leader>D "+D
  vnoremap <leader>d "+d
else
  set clipboard=unnamed
  nnoremap <leader>d "*d
  nnoremap <leader>D "*D
  vnoremap <leader>d "*d
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <F5> :call TrimWhitespace()<CR>

au VimEnter * let g:my_project_dir = getcwd()
fun! GoToProjectRootDir()
    let l:cmd = 'cd ' . g:my_project_dir
    execute cmd
    execute 'pwd'
endfunction

fun! GoToFileCurrentDirectory()
    execute 'cd %:p:h'
    execute 'pwd'
endfunction

" TODO: add bang option to force delete a buffer using Bd
command! Bd bp|bd#
command! Cd call GoToFileCurrentDirectory()
command! Pd call GoToProjectRootDir()

command! Ww exe 'w !SUDO_ASKPASS=/usr/bin/ssh-askpass sudo tee >/dev/null 2>&1 %'

inoremap <C-space> <C-x><C-o>

function UmlSvg() abort
  w
  ! plantuml -tsvg % &
  " !java -jar $HOME/lib/java/plantuml.jar -tsvg % &
endfunction

function UmlPng() abort
  w
  ! plantuml -tpng % &
  " !java -jar $HOME/lib/java/plantuml.jar -tsvg % &
endfunction

autocmd FileType plantuml command! PlantumlSvg call UmlSvg()
autocmd FileType plantuml command! PlantumlPng call UmlPng()
