local gruvbox = {
	"sainnhe/gruvbox-material",
	config = function()
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_disable_italic_comment = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.cmd.colorscheme("gruvbox-material")
	end,
}

return gruvbox
