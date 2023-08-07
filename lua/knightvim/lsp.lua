local auto_installed = function()
    if kvim.lsp.auto_install then
        return kvim.lsp.local_include
    end
    return false
end


require 'mason'.setup()
require('mason-lspconfig').setup({
    automatic_installation = auto_installed(),
})

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
            'n', '<leader>r',
            vim.lsp.buf.rename,
            { buffer = args.buf, desc = 'Rename a variable from lsp' })
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function(args)
        vim.lsp.buf.format()
    end,
})

for k, v in ipairs(kvim.lsp.local_include) do
    require('lspconfig')[v].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
end

-- Make sure you setup `cmp` after lsp-zero

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
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    sources = {
        { name = "nvim_lua" },
        { name = 'luasnip' },
        { name = 'nvim_lsp', },
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
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
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
