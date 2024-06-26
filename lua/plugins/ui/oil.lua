return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>oo",
            function()
                if vim.opt.filetype:get() ~= "oil" then
                    require("oil").open()
                else
                    require("oil").close()
                end
            end,
            desc = "Window toggle",
        },

        {
            "<leader>of",
            function()
                require("oil").toggle_float()
            end,
            desc = "Float toggle",
        }
    }
}
