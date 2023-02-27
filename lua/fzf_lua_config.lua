-- Use telescope default profile and override default previewer to 'bat'

-- change default color of border (White)
vim.api.nvim_set_hl(0, 'FzfCustomFloatBorderHl', {fg = "#5f5f5f"})

require('fzf-lua').setup({'telescope',
    winopts = {
        preview = {
           default = 'bat',
           horizontal = 'right:60%'
        },
        hl = {
            border = 'FzfCustomFloatBorderHl'
        }
    },
    keymap = {
        fzf = {
            ['ctrl-y'] = 'preview-up',
            ['ctrl-e'] = 'preview-down'
        }
    }
})

-- FZF mappings
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fl', ':FzfLua lines<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gr', ':FzfLua live_grep_native<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gw', ':FzfLua grep_cword<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gW', ':FzfLua grep_cWORD<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gv', ':FzfLua grep_visual<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gl', ':FzfLua lgrep_curbuf<CR>', {noremap = true})
