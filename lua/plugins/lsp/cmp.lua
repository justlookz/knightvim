return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },

        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-nvim-lua' },

        { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
        {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
                "rafamadriz/friendly-snippets"
            }
        },
        { "rcarriga/cmp-dap" },
        { 'windwp/nvim-autopairs' },
        { "paopaol/cmp-doxygen" }
    },
    config = function()
        local luasnip       = require("luasnip")
        local cmp           = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                    or require("cmp_dap").is_dap_buffer()
            end,
            -- completion = { autocomplete = false },
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
                { name = "doxygen" },
            },
            options = {
                trailing_slash = false,
            },
            mapping = {
                ["<C-n>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        cmp.complete()
                    end
                end,


                ["<C-j>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-p>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        cmp.complete()
                    end
                end,

                ["<C-k>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
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
