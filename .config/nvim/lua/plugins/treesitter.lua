local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local TSconfig = require("nvim-treesitter.configs")
		TSconfig.setup({
			ensure_installed = {
				"lua",
				"luau",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			auto_install = true,
		})
	end,
}
return treesitter
