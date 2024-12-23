return {
    'saghen/blink.cmp',
    version = '*',
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = { { 'L3MON4D3/LuaSnip', version = 'v2.*',
    config = function() 

        require('luasnip.loaders.from_vscode').lazy_load()
    end,
    dependencies = "rafamadriz/friendly-snippets",
},

        "rafamadriz/friendly-snippets"
    },
    opts = {

        completion = { menu = { auto_show = false, }, },

        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide' },
            ['<C-y>'] = { 'select_and_accept' },

            ['<C-p>'] = { 'select_prev', 'show' },
            ['<C-n>'] = { 'select_next', 'show' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-j>'] = { 'snippet_forward', 'fallback' },
            ['<C-k>'] = { 'snippet_backward', 'fallback' },
        },
        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },
        sources = {
            default = { 'lsp', 'path', 'luasnip', 'buffer' },
        },
    }
}
