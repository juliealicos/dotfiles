return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        'LukasPietzschmann/telescope-tabs',
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local telescope_tabs = require("telescope-tabs")

        telescope.setup({
            defaults = {
                -- path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to qflist and open
                        ["<C-a>"] = actions.select_all, -- send selected to qflist and open
                        ["<Esc>"] = actions.close
                        -- vim.keymap.set("i", "<Esc>", "<C-c>", { desc = "Exit telescope" })
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ft', telescope_tabs.list_tabs, {})
        vim.keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

        -- grep
        vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
        vim.keymap.set("n", "<leader>gw", builtin.grep_string, { desc = "Find string under cursor in cwd" })

        -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        -- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        --
        if (vim.g.colors_name == 'dracula' ) then
            vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = 'None', fg = '#6271A4'})
            vim.api.nvim_set_hl(0, "TelescopePromptCounter", {bg = 'None', fg = '#6271A4'})
            vim.api.nvim_set_hl(0, "DraculaBgLighter", {bg = '#6271A4', fg = '#FFFFFF'})
        end
    end,
}
