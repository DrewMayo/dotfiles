local treesitter = require("nvim-treesitter")
local tsconfig = require("nvim-treesitter.configs")

treesitter.build = ":TSUpdate"
tsconfig.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	auto_install = true,
})
