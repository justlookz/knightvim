local M = {

    -- Starry Collection - Themes
    --{ 'https://github.com/ray-x/starry.nvim' },

    --{ "lukas-reineke/lsp-format.nvim" },

}

if kvim.plugins then
    vim.tbl_deep_extend("force", M, kvim.plugins)
end
return M
