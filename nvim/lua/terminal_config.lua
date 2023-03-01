vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end
})
