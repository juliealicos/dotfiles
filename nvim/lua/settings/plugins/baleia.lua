return {
    "m00qek/baleia.nvim",
    version = "*",
    config = function()
        vim.g.baleia = require("baleia").setup({ })

        -- Command to colorize the current buffer
        vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
        end, { bang = true })

        -- Command to show logs 
        vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })

        vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
            pattern = "*.log",
            callback = function()
                vim.g.baleia.once(vim.api.nvim_get_current_buf())
            end,
        })

    end,
}
