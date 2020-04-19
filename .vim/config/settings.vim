let g:mapleader = ','

set nocompatible
filetype plugin indent on
" Auto read files edited outside vim
set autoread
set autochdir

" Vim perfomance
set ttyfast
set lazyredraw

set showcmd         " Show command on lower right
set laststatus=2
set noshowmode

" Normal backspace
set backspace=indent,eol,start

" Tab settings
set autoindent
set expandtab
set shiftround
set smarttab
" set shiftwidth=4
" set softtabstop=4
" set tabstop=4
" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

" use global clipboard for copy and past
set clipboard=unnamedplus

" Enable fuzzy search on :find
set path+=**

" Set partial search and result highlighting
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

" Show line number and listchars
set nu
set relativenumber
set list
set listchars=tab:▸\ ,trail:·

" Text Rendering
set encoding=utf-8
set colorcolumn=100
set nowrap
set sidescroll=1
" Always open vertical splits on the right
set splitright

" Show suggestions on command mode
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o,*.log,*.so,**/node_modules/**

set noeb vb t_vb=
set nofoldenable

" Recognize .tex files as latex (instead of plaintex) for syntax highlighting.
let g:tex_flavor="latex"
