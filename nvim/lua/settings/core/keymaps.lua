-- delete != cut

vim.keymap.set('n', 'x', '"_x', {noremap = true, silent = true})
vim.keymap.set('n', 'X', '"_X', {noremap = true, silent = true})
vim.keymap.set('n', 'd', '"_d', {noremap = true, silent = true})
vim.keymap.set('n', 'D', '"_D', {noremap = true, silent = true})
vim.keymap.set('v', 'd', '"_d', {noremap = true, silent = true})
vim.keymap.set('n', 'c', '"_c', {noremap = true, silent = true})
vim.keymap.set('n', 'C', '"_C', {noremap = true, silent = true})
vim.keymap.set('v', 'c', '"_c', {noremap = true, silent = true})

if vim.fn.has('unnamedplus') then
  vim.keymap.set('n', '<leader>d', '"+d', {noremap = true, silent = true})
  vim.keymap.set('n', '<leader>D', '"+D', {noremap = true, silent = true})
  vim.keymap.set('v', '<leader>d', '"+d', {noremap = true, silent = true})
else
  vim.keymap.set('n', '<leader>d', '"*d', {noremap = true, silent = true})
  vim.keymap.set('n', '<leader>D', '"*D', {noremap = true, silent = true})
  vim.keymap.set('v', '<leader>d', '"*d', {noremap = true, silent = true})
end

vim.keymap.set('n', '<leader>+', '<C-a>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>-', '<C-x>', {noremap = true, silent = true})

-- Highlight occurrences of the word under the cursor without moving the cursor
vim.keymap.set('n', '*', function()
  local word = vim.fn.expand('<cword>') -- Get the word under the cursor
  vim.fn.setreg('/', '\\<' .. word .. '\\>') -- Set the search register
  vim.opt.hlsearch = true -- Enable search highlighting
end, { noremap = true, silent = true })

vim.keymap.set('n', '<Esc>', function()
    -- If we find a floating window, close it.
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
            found_float = true
        end
    end

    if not found_float then
        if vim.opt.hlsearch:get() then
            vim.fn.setreg('/', '') -- Set the search register to empty, which clears the highlight
        else
            return '<Esc>' -- Default behavior
        end
    end

end, { noremap = true, silent = true})

-- Function to remove trailing whitespace
function RemoveTrailingWhitespace()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos(".", save_cursor)
end

-- Keymap to trigger the function with F6
vim.keymap.set( "n", "<F6>", function()
    RemoveTrailingWhitespace()
end, { noremap = true, silent = true })
