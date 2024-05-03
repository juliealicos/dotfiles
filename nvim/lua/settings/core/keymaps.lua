-- delete != cut

vim.keymap.set('n', 'x', '\"_x', {noremap = true})
vim.keymap.set('n', 'X', '\"_X', {noremap = true})
vim.keymap.set('n', 'd', '\"_d', {noremap = true})
vim.keymap.set('n', 'D', '\"_D', {noremap = true})
vim.keymap.set('v', 'd', '\"_d', {noremap = true})
vim.keymap.set('n', 'c', '\"_c', {noremap = true})
vim.keymap.set('n', 'C', '\"_C', {noremap = true})
vim.keymap.set('v', 'c', '\"_c', {noremap = true})

if vim.fn.has('unnamedplus') then
  vim.keymap.set('n', '<leader>d', '\"+d', {noremap = true})
  vim.keymap.set('n', '<leader>D', '\"+D', {noremap = true})
  vim.keymap.set('v', '<leader>d', '\"+d', {noremap = true})
else
  vim.keymap.set('n', '<leader>d', '\"*d', {noremap = true})
  vim.keymap.set('n', '<leader>D', '\"*D', {noremap = true})
  vim.keymap.set('v', '<leader>d', '\"*d', {noremap = true})
end

vim.keymap.set('n', '<leader>+', '<C-a>', {noremap = true})
vim.keymap.set('n', '<leader>-', '<C-x>', {noremap = true})
