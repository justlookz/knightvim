-- Gitsign - Github integration
return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        on_attach                    = function(bufnr)
            -- from Gitsigns
            local gs = package.loaded.gitsigns
            -- end --


            vim.keymap.set('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, {
                expr    = true,
                buffer  = bufnr,
                noremap = true,
                desc    = "Next Hunk"
            })

            vim.keymap.set('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, {
                expr    = true,
                buffer  = bufnr,
                noremap = true,
                desc    = "Previous Hunk"
            })

            vim.keymap.set(
                'n', '<leader>ugs',
                function()
                    vim.cmd.Gitsigns("toggle_signs")
                end,
                {
                    buffer  = bufnr,
                    desc    = "Toggle signs",
                    noremap = true,
                })

            vim.keymap.set(
                'n', '<leader>ugn',
                function()
                    vim.cmd.Gitsigns("toggle_numhl")
                end,
                {
                    buffer  = bufnr,
                    desc    = "Toggle Number Highlighting for sign",
                    noremap = true,
                })

            vim.keymap.set(
                'n', '<leader>ugc',
                function()
                    vim.cmd.Gitsigns("toggle_current_line_blame")
                end,
                {
                    buffer  = bufnr,
                    desc    = "Toggle Current line blame",
                    noremap = true,
                })
        end,

        -- settings
        signs                        = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signcolumn                   = false, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 200,
            ignore_whitespace = false,
        },

        current_line_blame_formatter =
        '<author>, <author_time:%Y-%m-%d> - <summary>',

        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm                         = {
            enable = false
        },
    }
}
