local state = require("telescope.state")
local action_state = require("telescope.actions.state")

local slow_scroll = function(prompt_bufnr, direction)
    local previewer = action_state.get_current_picker(prompt_bufnr).previewer
    local status = state.get_status(prompt_bufnr)

    -- Check if we actually have a previewer and a preview window
    if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
        return
    end

    previewer:scroll_fn(1 * direction)
end


vim.api.nvim_create_user_command(
    'RgDirs',
    function(opts)
        local dirs = opts.fargs -- fargs contains all arguments as a list
        require('telescope.builtin').live_grep({ search_dirs = dirs})
    end,
    {
        nargs = "*", -- Accept zero or more arguments
        complete = "dir", -- Auto-complete directories
    }
)

vim.api.nvim_create_user_command(
    'RgRawDirs',
    function(opts)
        local dirs = opts.fargs -- fargs contains all arguments as a list
        require("telescope").extensions.live_grep_args.live_grep_args({ search_dirs = dirs })
    end,
    {
        nargs = "*", -- Accept zero or more arguments
        complete = "dir", -- Auto-complete directories
    }
)

vim.api.nvim_create_user_command(
    'FindFilesDirs',
    function(opts)
        local dirs = opts.fargs -- fargs contains all arguments as a list
        require("telescope.builtin").find_files({ search_dirs = dirs })
    end,
    {
        nargs = "*", -- Accept zero or more arguments
        complete = "dir", -- Auto-complete directories
    }
)

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        'LukasPietzschmann/telescope-tabs',
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local telescope_tabs = require("telescope-tabs")

        -- Disable cursorline for TelescopePrompt Filetype
        vim.cmd[[
            augroup DisableCursorlineForTelescopePrompt
                autocmd!
                autocmd FileType TelescopePrompt lua vim.wo.cursorline = false
            augroup END
        ]]

        telescope.setup({
            defaults = {
                -- path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to qflist and open
                        ["<C-a>"] = actions.select_all, -- send selected to qflist and open
                        -- vim.keymap.set("i", "<Esc>", "<C-c>", { desc = "Exit telescope" })
                        ["<C-e>"] = function(bufnr) slow_scroll(bufnr, 1) end,
                        ["<C-y>"] = function(bufnr) slow_scroll(bufnr, -1) end,
                        ["<C-space>"] = actions.to_fuzzy_refine,
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")

        -- set keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fF', ":FindFilesDirs<Space>")
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ft', telescope_tabs.list_tabs, {})
        vim.keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

        -- grep
        vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>gd', ":RgDirs<Space>")
        vim.keymap.set("n", "<leader>gw", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        vim.keymap.set("n", "<leader>gR", ":RgRawDirs<Space>")

        -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        -- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        --
        if (vim.g.colors_name == 'dracula' ) then
            vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = 'None', fg = '#6271A4'})
            -- vim.api.nvim_set_hl(0, "TelescopePromptCounter", {bg = 'None', fg = '#6271A4'})
            vim.api.nvim_set_hl(0, "TelescopePromptCounter", {bg = 'None', fg = '#02AFFF'})
        end
    end,
}
