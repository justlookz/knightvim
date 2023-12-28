local M = {

    -- Starry Collection - Themes
    --{ 'https://github.com/ray-x/starry.nvim' },

    --{ "lukas-reineke/lsp-format.nvim" },

}

vim.tbl_deep_extend("force", M, kvim.plugins)
return M
