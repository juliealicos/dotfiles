vim.opt.syntax = on
vim.opt.swapfile = false

-- normal backspace
vim.opt.backspace = [[indent,eol,start]]

-- Auto read files edited outside vim
vim.opt.autoread = true

-- Allow to move on unsaved buffers
vim.opt.hidden = true

vim.opt.lazyredraw = true

-- status line 
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.shortmess:append("c")

-- tab settings
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

if vim.fn.has('unnamedplus') then
  vim.opt.clipboard=[[unnamed,unnamedplus]]
else
  vim.opt.clipboard=[[unnamed]]
end

-- Enable fuzzy search on find
vim.opt.path:append("**")

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show matching pairs
vim.opt.showmatch = true
vim.opt.matchpairs:append([[<:>,":"]])

-- Cursorline
vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true

-- Text rendering
vim.opt.encoding = 'utf-8'
if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  vim.opt.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:·]]
-- vim.opt.listchars = tab:→\ ,trail:·
else
  vim.opt.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

vim.opt.colorcolumn = '120'
vim.opt.wrap = false
vim.opt.sidescroll = 1

-- Always open vertical splits on the right
vim.opt.splitright = true
-- Always open horizontal splits below
vim.opt.splitbelow = true

-- Show suggestions on command mode
vim.opt.wildmenu = true
vim.opt.wildmode=[[longest:full,full]]
vim.opt.wildignorecase = true

-- bells
vim.opt.eb = false
vim.opt.vb = true

-- fold
vim.opt.foldenable = false

-- Cursorline highlighting control
--  Only have it on in the active buffer
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
