fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <F5> :call TrimWhitespace()<CR>
cmap w!! w !sudo tee >/dev/null %

" let g:plantuml_executable_script =  'java -jar $HOME/lib/java/plantuml.jar'
" autocmd FileType plantuml nnoremap <buffer> <F6> :silent make<CR><C-l>

function UmlPng() abort
  w
  let l:outputDir = '../output/png'
  !mkdir -p ../output/images/png && java -jar $HOME/lib/java/plantuml.jar % -o ../output/images/png
endfunction

function UmlSvg() abort
  w
  !mkdir -p ../output/images/svg&& java -jar $HOME/lib/java/plantuml.jar -tsvg % -o ../output/images/svg
  " !java -jar $HOME/lib/java/plantuml.jar -tsvg % &
endfunction

function MdToPdf() abort
 w
 let l:outputDir = '../output/pdf/'
 let l:bufName = expand('%t')
 let l:outputFile = l:outputDir . l:bufName . '.pdf'
 echo outputFile
 execute '!mkdir -p' shellescape(l:outputDir)
 execute '!markdown-pdf -o' shellescape(l:outputFile) shellescape(l:bufName)
"  !mkdir -p outp && markdown-pdf -o ../output/pdf/ % &
endfunction

autocmd FileType plantuml nnoremap <buffer> <leader>png :silent call UmlPng()<CR><C-l>
autocmd FileType plantuml nnoremap <buffer> <leader>svg :silent call UmlSvg()<CR><C-l>
autocmd FileType markdown nnoremap <buffer> <leader>pdf :silent call MdToPdf()<CR><C-l>
