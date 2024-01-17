return {
    'https://github.com/saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
    opts = {},
}
