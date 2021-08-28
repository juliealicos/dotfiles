
"Dracula settings"
color dracula
set termguicolors
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 1

set nocompatible
filetype plugin indent on

syntax on
set noswapfile

" Auto read files edited outside vim
set autoread

" allow to move on unsaved buffers
set hidden

" Vim perfomance
set lazyredraw

set showcmd         " Show command on lower right
set laststatus=2
set noshowmode
set pumheight=10
set shortmess+=c

" Normal backspace
set backspace=indent,eol,start

" Tab settings
set autoindent
set expandtab
set shiftround
set smarttab

" by default, the indent is 4 spaces.
set shiftwidth=4
set softtabstop=4
set tabstop=4

" by default, the indent is 2 spaces.
" set shiftwidth=2
" set softtabstop=2
" set tabstop=2

" use global clipboard for copy and paste
set clipboard=unnamedplus

" Enable fuzzy search on :find
set path+=**

" Set partial search and result highlighting
" set nois
set incsearch
set hlsearch

" Ignore case when searching
set ignorecase
set smartcase

" Show matching bracets
set showmatch
set matchpairs+=<:>,":"

" Highlight the cursor line
set cursorline
" highlight Cursor gui=reverse guifg=NONE guibg=NONE

" Show line number and listchars
set nu
set relativenumber
set list
set listchars=tab:→\ ,trail:·
highlight SpecialKey ctermfg=60 guifg=#5f5f87
highlight Whitespace ctermfg=60 guifg=#5f5f87

" Text Rendering
set encoding=utf-8
set colorcolumn=100
set nowrap
set sidescroll=1

" Always open vertical splits on the right
set splitright
" Always open horizontal splits below
set splitbelow

" Show suggestions on command mode
set wildmenu
set wildmode=longest:full,full
set wildignorecase

set noeb vb t_vb=
set nofoldenable

" remove cursorline on non active window
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

"Netrw settings"
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize = 20
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\s)\zs\.\S\+'

