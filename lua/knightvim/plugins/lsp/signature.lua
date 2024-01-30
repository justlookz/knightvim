return {
    "https://github.com/ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        always_trigger = true,
        auto_close_after = 3,
        handler_opts = { border = "shadow" },
        hint_prefix = ";",
        wrap = true,
        floating_window_above_cur_line = false,
    },
    config = function(_, opts)
        require 'lsp_signature'.setup(opts)
    end
}
