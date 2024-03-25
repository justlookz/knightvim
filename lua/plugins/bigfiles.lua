return {
    {
        "LunarVim/bigfile.nvim",
        priority = 9999,
        config = function()
            local size
            if vim.fn.has("termux") == 1 then
                size = 0.1
            else
                size = 1.5
            end
            require("bigfile").setup({
                filesize = size,
            })
        end
    }
}
