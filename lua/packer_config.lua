return require('packer').startup(
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Dracula Theme
    use 'dracula/vim'

    -- display icons, needs patch font installed in system and a terminal emulator that supports it
    use {
      'nvim-tree/nvim-web-devicons',
      run = function()
          local nvim_web_devicons = require('nvim-web-devicons').setup()
      end
    }

    -- Lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- For syntax highlighting
    use {
      'nvim-treesitter/nvim-treesitter',
      run =
      function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end
    }

    -- IDE like Auto completion for nvim
    use 'neovim/nvim-lspconfig'

    -- FZF for searching files and grepping
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Comment shortcut (gcc or gbc), supports vim motions
    use 'numToStr/Comment.nvim'

    -- File Explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
    }
  end
)
