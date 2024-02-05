return {
    "https://github.com/hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        { "https://github.com/hrsh7th/cmp-nvim-lsp" },
        { 'https://github.com/hrsh7th/nvim-cmp' },
        { 'https://github.com/L3MON4D3/LuaSnip' },

        { 'https://github.com/hrsh7th/cmp-buffer' },
        { 'https://github.com/hrsh7th/cmp-path' },
        { 'https://github.com/hrsh7th/cmp-cmdline' },
        { 'https://github.com/hrsh7th/cmp-nvim-lua' },
        { 'https://github.com/hrsh7th/cmp-calc' },

        { 'https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol' },
        { 'https://github.com/saadparwaiz1/cmp_luasnip' },
        { "https://github.com/rcarriga/cmp-dap" },
        { 'https://github.com/windwp/nvim-autopairs' },
        { "https://github.com/rafamadriz/friendly-snippets", },
    },
    config = function()
        local luasnip       = require("luasnip")
        local cmp           = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        require('luasnip.loaders.from_vscode').lazy_load()

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(
                vim.api.nvim_win_get_cursor(0)
            )
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                    or require("cmp_dap").is_dap_buffer()
            end,

            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            sources = {
                { name = "nvim_lua" },
                { name = 'nvim_lsp', },
                { name = 'luasnip' },
                { name = "path", },
                -- { name = "cmdline" },
                { name = "buffer", },
                { name = 'nvim_lsp_document_symbol' },
                { name = "calc", },
            },
            options = {
                trailing_slash = false,
            },
            mapping = {
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-f>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-b>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({ select = false }),
                ['<CR>']  = cmp.mapping.confirm({ select = false }),
            },

            experimental = { ghost_text = kvim.lsp.ghost_text, },
        })
        -- Setup for dapui
        cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            sources = {
                { name = "dap" },
            },
        })

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )


        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end,
}
