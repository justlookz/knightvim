return {

    theme = 'doom',
    config = {
        header = {}, --your header
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'f',
                keymap = 'f',
                key_hl = 'Number',
                action = 'Telescope find_files'
            },
            {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'd',
                keymap = '',
                action = 'Telescope dotfiles'
            },
        },
        footer = {} --your footer
    }
}
