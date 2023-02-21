require('plugins')

vim.cmd[[
    colorscheme dracula
]]

vim.cmd[[
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
]]

vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod     = 'expr'
        vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    end
})

vim.api.nvim_set_hl( 0, 'RowActiveHl', { foreground = 'White', background = '#5b7fbb'} )
vim.api.nvim_set_hl( 0, 'ColActiveHl', { foreground = 'White', background = '#6272a4'} )

local function displayRow()
    return "row: %l/%L"
end

local function displayColumn()
    return "col: %c"
end

require('lualine').setup {
    options = {
        theme = 'dracula',
        component_separators = {''},
        section_separators = {''},
    },
    sections = {
        lualine_c = {
            {'filename', path = 1}
        },
        lualine_y = {},
        lualine_z = {
            {
                displayRow
            },
            {
                displayColumn
            }
        }
    },

    inactive_sections = {
        lualine_c = {
            {'filename', path = 1}
        },
        lualine_x = {
            {'encoding'},
            {'fileformat'},
            {'filetype'},
        },
        lualine_y = {},
        lualine_z = {
            {
                displayRow
            },
            {
                displayColumn
            }
        }

    }
}
