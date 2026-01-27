local treesitter = require("nvim-treesitter")
local tsconfig = require("nvim-treesitter.configs")

treesitter.build = ":TSUpdate"
tsconfig.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    auto_install = true,
})
