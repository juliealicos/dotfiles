-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Override default folder closed arrow icon as it's too big
require("nvim-tree").setup({
  -- hijack_cursor = true,
  view = {
    width = 50
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "❯"
        }
      }
    }
  }
})

vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', {noremap = true})
