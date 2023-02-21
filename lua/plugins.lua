return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Lualine
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run =
            function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end
        }

        -- use {
        --     'nvim-tree/nvim-tree.lua',
        --     requires = {
        --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
        --     },
        -- }
    end
)
