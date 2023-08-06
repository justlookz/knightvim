local lsp = require('lsp-zero').preset({})

local auto_installed = function()
    if kvim.lsp.auto_install then
        return kvim.lsp.local_include
    end
    return false
end

require 'mason'.setup()
require('mason-lspconfig').setup({
    automatic_installation = auto_installed(),
    handlers = { lsp.default_setup },
})

lsp.skip_server_setup(kvim.lsp.local_include)

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
    omit = { "gd, gD" }
    vim.keymap.set('n', 'gd', require("telescope.builtin").lsp_definitions, { buffer = true })
    vim.keymap.set('n', 'gD', require("telescope.builtin").lsp_implementations, { buffer = true })
end)

for k, v in ipairs(kvim.lsp.local_include) do
    require('lspconfig')[v].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
end

lsp.setup()

-- Make sure you setup `cmp` after lsp-zero

require('nvim-autopairs').setup({
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    -- enable_check_bracket_line = false

})

require('lsp-zero').extend_cmp()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')


require('luasnip.loaders.from_vscode')
    .lazy_load()

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
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    experimental = { ghost_text = kvim.lsp.ghost_text, },
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
