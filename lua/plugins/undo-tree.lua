-- Undo Tree - History like undo
return {
    'https://github.com/mbbill/undotree',
    lazy = false,
    event = "VeryLazy",
    keys = {
        -- Undo Tree
        {
            "<leader>uu",
            vim.cmd.UndotreeToggle,
            desc = "Undo Tree Structure",
        },
    }
}
