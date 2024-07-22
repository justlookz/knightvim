return {
    'echasnovski/mini.clue',
    version = false,
    config = function()
        local miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),

                -- User spesific
                { mode = 'n', keys = '<Leader>d',   desc = '+Debugger' },
                { mode = 'n', keys = '<Leader>f',   desc = '+Fold' },
                { mode = 'n', keys = '<Leader>o',   desc = '+Persistent options' },
                { mode = 'n', keys = '<Leader>o',   desc = '+Oil' },
                { mode = 'n', keys = '<Leader>s',   desc = '+search' },
                { mode = 'n', keys = '<Leader>sg',  desc = '+Git' },
                { mode = 'n', keys = '<Leader>sgt', desc = '+Type' },
                { mode = 'n', keys = '<Leader>u',   desc = '+UI options' },
                { mode = 'n', keys = '<Leader>ug',  desc = '+Git' },
                { mode = 'n', keys = '<Leader>us',  desc = '+settings' },
                { mode = 'n', keys = '<Leader>K',   desc = '+Knightvim options' },
                { mode = 'n', keys = '<Leader>L',   desc = '+Lazy' },
                { mode = 'n', keys = '<Leader>l',   desc = '+LSP options' },
                { mode = 'n', keys = '<Leader>g',   desc = '+Git' },
                { mode = 'n', keys = '<Leader>d',   desc = '+Debugger' },
            },
        })
    end
}
