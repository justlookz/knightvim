return {
    'https://github.com/kristijanhusak/vim-dadbod-ui',
    dependencies = {
        {
            'https://github.com/tpope/vim-dadbod',
            lazy = true
        },
        {
            'https://github.com/kristijanhusak/vim-dadbod-completion',
            ft = { 'sql', 'mysql', 'plsql' },
            lazy = true
        },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
