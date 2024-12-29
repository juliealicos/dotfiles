return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    -- Fix after upgrading to nvim 0.10
    opts = {
        options = {
            mode = "tabs",
        },
    },
}
