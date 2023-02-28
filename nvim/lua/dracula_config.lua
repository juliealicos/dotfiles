vim.opt.termguicolors = true
vim.cmd('colorscheme dracula')
vim.g.dracula_bold = 1
vim.g.dracula_italic = 1
vim.g.dracula_underline = 1
vim.g.dracula_undercurl = 1
vim.g.dracula_inverse = 1
vim.g.dracula_colorterm = 1

-- To make SpecialKey and Whitespace chars visible on cursorline with Dracula Theme
vim.api.nvim_set_hl(0, 'SpecialKey', {fg = "#5f5f87"})
vim.api.nvim_set_hl(0, 'Whitespace', {fg = "#5f5f87"})

-- Make Float match Dracula bg color, also change border color
vim.api.nvim_set_hl(0, "NormalFloat", {bg = 'None', fg = 'None'})
vim.api.nvim_set_hl(0, "FloatBorder", {bg = 'None', fg = '#6271A4'})
