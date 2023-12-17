-- load config for packer plugin manager
require('packer_config')

-- load theme first
require('dracula_config')

-- load config for nvim
require('nvim_config')

-- load config for lualine plugin
require('lualine_config')

-- load custom key bindings
require('mappings_config')

-- Treesitter for syntax highlighting
require('treesitter_config')

-- LSP config
require('lsp_config')

-- FZF config
require('fzf_lua_config')

-- nvim-tree config
require('nvim_tree_config')

-- comment.nvim config
require('comment_nvim_config')

require('terminal_config')

require 'colorizer'.setup {
    filetypes = { "css", "scss" },
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      -- names = true, -- "Name" codes like Blue or blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      AARRGGBB = false, -- 0xAARRGGBB hex codes
      -- rgb_fn = false, -- CSS rgb() and rgba() functions
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = "background", -- Set the display mode.
      -- Available methods are false / true / "normal" / "lsp" / "both"
      -- True is same as normal
      tailwind = false, -- Enable tailwind colors
      -- parsers can contain values used in |user_default_options|
      sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
      virtualtext = "■",
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},

}
-- require('nvim-highlight-colors').setup {}
vim.g.python3_host_prog = '/usr/bin/python3'
