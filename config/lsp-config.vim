"nvim-lsp settings"

lua << EOF
-- language server setup

-- C Language Server
require'lspconfig'.clangd.setup{}
-- Python Language Server
require'lspconfig'.pyright.setup{}
-- Bash Language Server
require'lspconfig'.bashls.setup{}
-- Docker Language Server
require'lspconfig'.dockerls.setup{}
-- Vim language Server
require'lspconfig'.vimls.setup{}
-- yaml language Server
require'lspconfig'.yamlls.setup{}
-- CMake language Server
require'lspconfig'.cmake.setup{}

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

vim.o.completeopt = "menuone,noinsert"

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
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
                      update_in_insert = false,
                  }
                  )
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "bashls", "clangd", "pyright", "dockerls", "vimls", "yamlls", "cmake"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


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

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.move_down_C_j()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.move_up_C_k()", {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.select_selection()", {expr = true})
vim.api.nvim_set_keymap("i", "<Esc>", "v:lua.cancel_selection()", {expr = true})

EOF
