"Netrw settings"
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\s)\zs\.\S\+'
let g:netrw_winsize = 25

let g:colors = {
      \ 'brown': ["#905532", 95],
      \ 'aqua': ["#3AFFDB", 86],
      \ 'blue': ["#689FB6", 73],
      \ 'darkBlue': ["#44788E", 66],
      \ 'purple': ["#834F79", 93],
      \ 'red': ["#AE403F", 131],
      \ 'darkRed': ["#97050C", 88],
      \ 'beige': ["#F5C06F", 215],
      \ 'yellow': ["#F09F17", 214],
      \ 'orange': ["#D4843E", 172],
      \ 'orange2': ["#DD5E1C", 166],
      \ 'darkOrange': ["#F16529", 202],
      \ 'pink': ["#CB6F6F", 167],
      \ 'lightGreen': ["#8FAA54", 107],
      \ 'green': ["#31B53E", 71],
      \ 'white': ["#FFFFFF", 231],
      \}

fun s:PatchDraculaScheme()
  " hi! ColorColumn ctermfg=255 ctermbg=203 guifg=#F8F8F2 guibg=#FF5555

  " Show NERDTree directory nodes in yellow
  hi! __DirectoryNode cterm=bold ctermfg=214 gui=bold guifg=#E7A427
  hi! link NerdTreeDir __DirectoryNode
  hi! link NERDTreeFlags __DirectoryNode

  " Show NERDTree toggle icons as white
  hi! link NERDTreeOpenable Normal
  hi! link NERDTreeClosable Normal
endf

" Customime color scheme after it was loaded
augroup aug_color_scheme
  au!

  autocmd ColorScheme dracula call s:PatchDraculaScheme()
augroup END

augroup aug_nerd_tree
  au!

  " Auto launch tree when vim is run with directory as argument
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " Exit vim when the only buffer remaining is NerdTree
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Use arrow keys to navigate
  autocmd FileType nerdtree nmap <buffer> l o
  autocmd FileType nerdtree nmap <buffer> L O
  autocmd FileType nerdtree nmap <buffer> h p
  autocmd FileType nerdtree nmap <buffer> H P
  " Disable cursorline in NERDtree to avoid lags
  " built-in g:NERDTreeHighlightCursorline does not work
  autocmd FileType nerdtree setlocal nocursorline
augroup END

set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=40
let NERDTreeAutoDeleteBuffer=1
" Tweak status line, so it shortens path if it's under HOME directory
let g:NERDTreeStatusline="%{exists('b:NERDTree')? fnamemodify(b:NERDTree.root.path.str(), ':p:~') :''}"
" nnoremap <leader>f :NERDTreeFind<CR>

" Do not show brackets around icons in NERDTree
let g:webdevicons_conceal_nerdtree_brackets = 1

" Show icons for directories
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

" Use different icons for opened and closed folder
let g:DevIconsEnableFoldersOpenClose = 1

" Do not put extra whitespace before icon
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''

" Colorize devicons
let g:devicons_colors = {
      \ 'brown': ['', '', ''],
      \ 'aqua': [''],
      \ 'blue': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'purple': ['', '', '', '', '', '', ''],
      \ 'red': ['', '', '', '', '', ''],
      \ 'beige': ['', '', '', ''],
      \ 'yellow': ['', '', 'λ', ''],
      \ 'orange': ['', '', ''],
      \ 'darkOrange': ['', '', '', ''],
      \ 'pink': ['', ''],
      \ 'green': ['', '', '', '', '', '', '', ''],
      \ 'white': ['', '', '', '', ''],
      \ }
augroup aug_vim_devicons
  au!

  " Apply devicons coloring only for NERDtree buffer
  for color in keys(g:devicons_colors)
    exec 'autocmd FileType nerdtree syntax match devicons_' . color . ' /\v' . join(g:devicons_colors[color], '.|') . './ containedin=ALL'
    exec 'autocmd FileType nerdtree highlight devicons_' . color . ' guifg=' .g:colors[color][0] . ' ctermfg=' . g:colors[color][1]
  endfor
augroup END
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

map <F3> :NERDTreeToggle<CR>
