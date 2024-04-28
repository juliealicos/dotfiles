-- disable omnifunc opening a split window
-- lsp uses omnifunc
vim.opt.completeopt = "menuone,noinsert"
vim.keymap.set('i', '<C-space>', '<C-x><C-o>', {noremap = true})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Also add border on diagnostic float window
vim.diagnostic.config({
  float = {
    border = 'rounded'
  }
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                  vim.lsp.diagnostic.on_publish_diagnostics, {
                      -- Enable underline, use default values
                      underline = true,
                      -- disable virtual text
                      virtual_text = false,
                      -- Use a function to dynamically turn signs off
                      -- and on, using buffer local variables
                      -- signs = function(bufnr, client_id)
                      --   return vim.bo[bufnr].show_signs == false
                      -- end,
                      signs = true,
                      -- Disable a feature
                      update_in_insert = false
                  }
                  )

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- setup LSP here
-- Listed LSP should be installed in the system manually
local servers = {
    'bashls',
    'clangd',
    'cmake',
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'eslint',
    'html',
    'jsonls',
    'pyright',
    'sqlls',
    'yamlls'
 }

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup({
    on_attach = on_attach,
    flags = lsp_flags
  })
end

-- Addtional mappings for LSP
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use <C-j> <C-k>
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.move_down_C_j = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<C-j>"
  end
end

_G.move_up_C_k = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<C-k>"
  end
end

_G.select_selection = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-y>"
  else
    return t "<Tab>"
  end
end

_G.cancel_selection = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-e>"
  else
    return t "<Esc>"
  end
end

vim.keymap.set("i", "<C-j>", "v:lua.move_down_C_j()", {expr = true})
vim.keymap.set("i", "<C-k>", "v:lua.move_up_C_k()", {expr = true})
vim.keymap.set("i", "<Tab>", "v:lua.select_selection()", {expr = true})
vim.keymap.set("i", "<Esc>", "v:lua.cancel_selection()", {expr = true})
