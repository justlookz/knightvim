if vim.fn.executable("black") then
    vim.api.nvim_create_autocmd("FileWritePre", {
        group = vim.api.nvim_create_augroup('Python-Black', { clear = true }),
        callback = function()
            vim.cmd [[silent ! black '%']]
        end
    })
end
