local lsp_group =
    vim.api.nvim_create_augroup(
        "lsp_group", { clear = true }
    )
vim.api.nvim_create_autocmd('LspAttach', {
    group = lsp_group,
    callback = function(args)
        vim.keymap.set(
            'n', 'K',
            vim.lsp.buf.hover,
            { buffer = args.buf, desc = "Documentation from lsp" })

        vim.keymap.set(
            'n', '<leader>sd',
            require("telescope.builtin")
            .lsp_definitions,
            { buffer = args.buf, desc = "Definitions from lsp" })

        vim.keymap.set(
            'n', '<leader>std',
            require("telescope.builtin")
            .lsp_type_definitions,
            { buffer = args.buf, desc = "Type definitions from lsp" })

        vim.keymap.set(
            'n', '<leader>si',
            require("telescope.builtin")
            .lsp_implementations,
            { buffer = args.buf, desc = "Implementations from lsp" })

        vim.keymap.set(
            'n', 'gD',
            vim.lsp.buf.declaration,
            {
                buffer = args.buf,
                desc   = 'Declaration from lsp'
            })

        vim.keymap.set(
            'n', 'gd',
            vim.lsp.buf.definition,
            {
                buffer = args.buf,
                desc   = 'Definition from lsp'
            })

        vim.keymap.set(
            'n', 'gm',
            vim.lsp.buf.implementation,
            {
                buffer  = args.buf,
                desc    = 'Implementation from lsp',
                noremap = true,
            })

        vim.keymap.set(
            'n', 'gh',
            vim.lsp.buf.signature_help,
            {
                buffer  = args.buf,
                desc    = 'Signature help from lsp',
                noremap = true,
            })


        vim.keymap.set(
            'n', 'ga',
            vim.lsp.buf.code_action,
            {
                buffer = args.buf,
                desc   = 'Code actions from lsp'
            })

        vim.keymap.set(
            'n', 'gtd',
            vim.lsp.buf.type_definition,
            {
                buffer = args.buf,
                desc   = 'Definition from lsp'
            })

        vim.keymap.set(
            'n', '<leader>r',
            vim.lsp.buf.rename,
            {
                buffer = args.buf,
                desc   = 'Rename a variable from lsp'
            })

        vim.keymap.set(
            'n', ']d',
            vim.diagnostic.goto_next,
            {
                buffer = args.buf,
                desc   = "Next diagnostic"
            })

        vim.keymap.set(
            'n', '[d',
            vim.diagnostic.goto_prev,
            {
                buffer = args.buf,
                desc   = "Previous diagnostic"
            })

        -- End of Keymaps --------------------


        -- Before Write ----------------------
        local auto_save_group =
            vim.api.nvim_create_augroup(
                "auto_save_group", { clear = true }
            )
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = auto_save_group,
            callback = function()
                local client = vim.lsp.get_active_clients()[1]

                if client then
                    if client.server_capabilities.documentFormattingProvider and kvim.lsp.autoformat then
                        vim.lsp.buf.format { async = false }
                    end
                end
            end,
        })
        -- end before Write ------------------
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            local hightlight_word_group =
                vim.api.nvim_create_augroup(
                    "hightlight_word_group", { clear = true }
                )

            vim.api.nvim_create_autocmd(
                { "CursorHold", "CursorHoldI" },
                {
                    group = hightlight_word_group,
                    buffer = args.buf,
                    callback = vim.lsp.buf.document_highlight
                }
            )

            vim.api.nvim_create_autocmd(
                { "CursorMoved", "CursorMovedI" },
                {
                    group = hightlight_word_group,
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references
                }
            )
        end
    end, -- callback end
})
