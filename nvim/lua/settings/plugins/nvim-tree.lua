return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")
        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Override default folder closed arrow icon as it's too big
        require("nvim-tree").setup({
            -- hijack_cursor = true,
            view = {
                width = 50,
                relativenumber = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            -- Uses Fura Nerd Font Mono
                            arrow_closed = '',
                            arrow_open = '',
                        }
                    }
                }
            }
        })

        vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
        vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
        vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
    end
}
