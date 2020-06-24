fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <F5> :call TrimWhitespace()<CR>
" cmap w!! w !sudo tee >/dev/null %

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
command!  WW exe 'w !SUDO_ASKPASS=/usr/bin/ssh-askpass sudo tee >/dev/null %'

function WriteAndRsync() abort
  w
  let l:remoteDir = 'gravador@bhling21.apac.nsn-net.net:/var/fpwork/gravador/CNI-34348-Rebase/'
  let l:fileToSync = expand('%')
  let l:command = '!rsync -z ' . l:fileToSync . ' ' . l:remoteDir . l:fileToSync . ' 2>/dev/null &'
  execute l:command
endfunction

command! Wsync :silent call WriteAndRsync()

function Sync(dir) abort
  let l:remoteDir = 'gravador@bhling21.apac.nsn-net.net:/var/fpwork/gravador/CNI-34348-Rebase/'
  let l:command = '!rsync -az ' . l:remoteDir . a:dir . ' ' . a:dir . ' 2>/dev/null &'
  execute l:command
endfunction

command! -nargs=1 -complete=dir Sync :silent call Sync(<f-args>)
nnoremap <leader>ss :Sync<space>

nnoremap <leader>0 :noh<Cr>:<backspace>

" let g:plantuml_executable_script =  'java -jar $HOME/lib/java/plantuml.jar'
" autocmd FileType plantuml nnoremap <buffer> <F6> :silent make<CR><C-l>

function UmlPng() abort
  w
  let l:outputDir = '../output/png'
  !mkdir -p ../output/images/png && java -jar $HOME/lib/java/plantuml.jar % -o ../output/images/png 2>/dev/null &
endfunction

function UmlSvg() abort
  w
  !mkdir -p ../output/images/svg && java -jar $HOME/lib/java/plantuml.jar -tsvg % -o ../output/images/svg 2>/dev/null &
  " !java -jar $HOME/lib/java/plantuml.jar -tsvg % &
endfunction

function MdToPdf() abort
 w
 let l:outputDir = '../output/pdf/'
 let l:bufName = expand('%t')
 let l:outputFile = l:outputDir . l:bufName . '.pdf'
 let l:argsLineBreak = '-m {\"breaks\":false} '
 let l:argsOutputFile = '-o ' . l:outputFile . ' ' . l:bufName
 execute '!mkdir -p' shellescape(l:outputDir)
 execute '!markdown-pdf ' . l:argsLineBreak . l:argsOutputFile ' 2>/dev/null &'
"  execute '!markdown-pdf' shellescape(l:outputFile) shellescape(l:bufName)
"  !mkdir -p outp && markdown-pdf -o ../output/pdf/ % &
endfunction

autocmd FileType plantuml nnoremap <buffer> <leader>png :silent call UmlPng()<CR><C-l>
autocmd FileType plantuml nnoremap <buffer> <leader>svg :silent call UmlSvg()<CR><C-l>
autocmd FileType markdown nnoremap <buffer> <leader>pdf :silent call MdToPdf()<CR><C-l>
