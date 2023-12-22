local core = {

    -- Starry Collection - Themes
    --{ 'https://github.com/ray-x/starry.nvim' },

    --{ "lukas-reineke/lsp-format.nvim" },

}

vim.tbl_deep_extend("force", core, kvim.plugins)
return core
