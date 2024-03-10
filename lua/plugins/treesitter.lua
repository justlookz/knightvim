-- treesitter - for highlighting
return {
    { "https://github.com/windwp/nvim-ts-autotag" },
    { "https://gitlab.com/HiPhish/rainbow-delimiters.nvim" },

    {
        "https://github.com/nvim-treesitter/nvim-treesitter-context",
        opts = { enable = true, },
    },

    {
        "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter" },
    },

    {
        "https://github.com/Wansmer/treesj",
        opts = {
            use_default_keymaps = false,
        },
        keys = {
            {
                "<leader>ff",
                function()
                    require("treesj").toggle()
                end,
                desc = "Toggle split - join",
            },
            {
                "<leader>fs",
                function()
                    require("treesj").split()
                end,
                desc = "Split",
            },
            {
                "<leader>fj",
                function()
                    require("treesj").join()
                end,
                desc = "Join",
            },
        }
    },

    {
        'https://github.com/nvim-treesitter/nvim-treesitter',
        build = ":silent TSUpdateSync",
        event = "VeryLazy",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "sql" },

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
                textobjects      = {

                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            -- You can optionally set descriptions to the mappings (used in the desc parameter of
                            -- nvim_buf_set_keymap) which plugins like which-key display
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V',  -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = true,
                    },

                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                            --
                            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                            ["]o"] = "@loop.*",
                            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                            --
                            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        -- Below will go to either the start or the end, whichever is closer.
                        -- Use if you want more granular movements
                        -- Make it even more gradual by adding multiple queries and regex.
                        goto_next = {
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[d"] = "@conditional.outer",
                        }
                    },
                },
            }

            vim.o.foldmethod     = "expr"
            vim.o.foldexpr       = "nvim_treesitter#foldexpr()"
            vim.o.foldlevelstart = 99

            vim.api.nvim_create_autocmd("BufWinEnter", {
                group = vim.api.nvim_create_augroup("kvim-ts-Buf-Enter", { clear = true }),
                callback = function()
                    vim.cmd [[silent! loadview]]
                end
            })

            vim.api.nvim_create_autocmd("BufWinLeave", {
                group = vim.api.nvim_create_augroup("kvim-ts-Buf-Leave", { clear = true }),
                callback = function()
                    vim.cmd [[silent! mkview]]
                end
            })
        end,
    }
}
