-- Auto close bracket
return {
    'https://github.com/windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
        ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
        -- enable_check_bracket_line = false
    },
}
