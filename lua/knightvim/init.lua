kvim = {}
kvim.theme = "rose-pine-moon"
kvim.leader = " "
kvim.plugins = {}
kvim.builtins = {}
kvim.lsp = {}
kvim.lsp.local_include = {}

require "user"

require("knightvim.options")
require("knightvim.bootstart")
require("knightvim.keymap")
require("knightvim.lsp")
