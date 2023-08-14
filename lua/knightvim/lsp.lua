local auto_installed = function()
    if kvim.lsp.auto_install then
        return kvim.lsp.local_include
    end
    return true
end

require 'mason'.setup()
require('mason-lspconfig').setup({
    automatic_installation = auto_installed(),
})

-- Keymaps for Lsp - If not lsp exist no keymap exists
vim.api.nvim_create_autocmd('LspAttach', {
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
            { buffer = args.buf, desc = 'Declaration from lsp' })

        vim.keymap.set(
            'n', 'gd',
            vim.lsp.buf.definition,
            { buffer = args.buf, desc = 'Definition from lsp' })

        vim.keymap.set(
            'n', 'gm',
            vim.lsp.buf.implementation,
            {
                buffer = args.buf,
                desc = 'Implementation from lsp',
                noremap = true,
            })

        vim.keymap.set(
            'n', 'gh',
            vim.lsp.buf.signature_help,
            {
                buffer = args.buf,
                desc = 'Signature help from lsp',
                noremap = true,
            })


        vim.keymap.set(
            'n', 'gc',
            vim.lsp.buf.code_action,
            { buffer = args.buf, desc = 'Code actions from lsp' })

        vim.keymap.set(
            'n', 'gtd',
            vim.lsp.buf.type_definition,
            { buffer = args.buf, desc = 'Definition from lsp' })

        vim.keymap.set(
            'n', '<leader>r',
            vim.lsp.buf.rename,
            { buffer = args.buf, desc = 'Rename a variable from lsp' })

        vim.keymap.set(
            'n', ']d',
            vim.diagnostic.goto_next,
            { buffer = args.buf, desc = "Next diagnostic" })

        vim.keymap.set(
            'n', '[d',
            vim.diagnostic.goto_prev,
            { buffer = args.buf, desc = "Previous diagnostic" })
    end, -- callback end
})
-- End of Keymaps ----------------------------


vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function(args)
        pcall(vim.lsp.buf.format)
    end,
})


-- Activate LspServers -----------------------
local lsp_server = require("mason-lspconfig")
    .get_installed_servers()

--- Helper function for lsp configuration
--- @param lsp_list table: Is a table with string names of
--- Servers that are available from Mason or the System
--- by using the execution command as name
local function lsp_server_setup(lsp_list)
    if lsp_server ~= nil then
        for _, v in ipairs(lsp_list) do
            require('lspconfig')[v].setup({
                capabilities = require('cmp_nvim_lsp')
                    .default_capabilities(),
            })
        end
    end
end

lsp_server_setup(lsp_server)
lsp_server_setup(kvim.lsp.local_include)

----------------------------------------------


-- Autoclose Brackets
require('nvim-autopairs').setup({
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    -- enable_check_bracket_line = false
})

local luasnip = require("luasnip")
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')


require('luasnip.loaders.from_vscode')
    .lazy_load()

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(
        vim.api.nvim_win_get_cursor(0)
    )
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
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
        ["<Tab>"] = cmp.mapping(function(fallback)
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

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    experimental = { ghost_text = kvim.lsp.ghost_text, },
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
