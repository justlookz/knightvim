-- treesitter - for highlighting
return {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    build = ":silent TSUpdateSync",
    config = function()
        -- code
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },

            sync_install     = false,

            auto_install     = true,

            indent           = { enable = true },

            autotag          = { enable = true },

            rainbow          = { enable = true, extendent_mode = true },

            ignore_install   = {},

            highlight        = {
                enable = true,

                ---@diagnostic disable-next-line: unused-local
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                additional_vim_regex_highlighting = false,
            },
        }

        vim.o.foldmethod = "expr"
        vim.o.foldexpr = "nvim_treesitter#foldexpr()"
        vim.o.foldlevelstart = 99

        vim.api.nvim_create_autocmd("BufWinEnter", {
            callback = function()
                vim.cmd [[silent! loadview]]
            end
        })

        vim.api.nvim_create_autocmd("BufWinLeave", {
            callback = function()
                vim.cmd [[mkview]]
            end
        })
    end,
}
