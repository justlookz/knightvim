-- treesitter - for highlighting
return {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    config = function()
        -- code
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },

            sync_install     = false,

            auto_install     = true,

            ignore_install   = {},

            highlight        = {
                enable = true,

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

        pcall(vim.cmd, 'MasonUpdate')
    end,
}
