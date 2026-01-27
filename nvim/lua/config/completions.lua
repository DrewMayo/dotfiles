local blink = require("blink.cmp")

blink.dependencies = "rafamadriz/friendly-snippets"

blink.signature = {
    enabled = true,
}

blink.version = "*"
blink.opts = {
    keymap = { preset = "default" },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
}

blink.opts_extend = { "sources.default" }
blink.setup()
