return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
        'hrsh7th/cmp-nvim-lsp-signature-help'
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        local lspkind = require("lspkind")

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp_kinds = {
            Text = '  ',
            Method = '  ',
            Function = '  ',
            Constructor = '  ',
            Field = '  ',
            Variable = '  ',
            Class = '  ',
            Interface = '  ',
            Module = '  ',
            Property = '  ',
            Unit = '  ',
            Value = '  ',
            Enum = '  ',
            Keyword = '  ',
            Snippet = '  ',
            Color = '  ',
            File = '  ',
            Reference = '  ',
            Folder = '  ',
            EnumMember = '  ',
            Constant = '  ',
            Struct = '  ',
            Event = '  ',
            Operator = '  ',
            TypeParameter = '  ',
        }

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            window = {
                -- documentation = {
                --     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
                -- },
                --
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                completeopt = "menu,menuone,preview,noselect",
                -- autocomplete = false,
                -- completeopt = "menuone,preview,noinsert",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-e>"] = cmp.mapping.scroll_docs(1),
                ["<C-y>"] = cmp.mapping.scroll_docs(-1),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if #cmp.get_entries() == 1 then
                                cmp.confirm({ select = true })
                            else
                                cmp.select_next_item()
                            end
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                            if #cmp.get_entries() == 1 then
                                cmp.confirm({ select = true })
                            end
                        else
                            fallback()
                        end
                    end),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if #cmp.get_entries() == 1 then
                                cmp.confirm({ select = true })
                            else
                                cmp.select_prev_item()
                            end
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                            if #cmp.get_entries() == 1 then
                                cmp.confirm({ select = true })
                            end
                        else
                            fallback()
                        end
                    end),
            },
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp"},
                { name = "nvim_lsp_signature_help"},
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),

            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    symbol_map = {
                        Text = '  ',
                        Method = '  ',
                        Function = '  ',
                        Constructor = '  ',
                        Field = '  ',
                        Variable = '  ',
                        Class = '  ',
                        Interface = '  ',
                        Module = '  ',
                        Property = '  ',
                        Unit = '  ',
                        Value = '  ',
                        Enum = '  ',
                        Keyword = '  ',
                        Snippet = '  ',
                        Color = '  ',
                        File = '  ',
                        Reference = '  ',
                        Folder = '  ',
                        EnumMember = '  ',
                        Constant = '  ',
                        Struct = '  ',
                        Event = '  ',
                        Operator = '  ',
                        TypeParameter = '  ',
                    },
                    -- maxwidth = 80,
                    -- ellipsis_char = "...",
                }),
            },
        })
    end,
}
