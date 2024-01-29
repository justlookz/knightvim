return {
    "https://github.com/ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        always_trigger = true,
        auto_close_after = 3,
        border = "shadow",
        hint_prefix = ";",
    },
    config = function(_, opts)
        require 'lsp_signature'.setup(opts)
    end
}
