--options
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.wo.relativenumber = false
vim.wo.signcolumn = "yes"
vim.g.maplocalleader = ","

--plugins
vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.lib",
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/lervag/vimtex",
	"https://github.com/R-nvim/R.nvim",
})

--one liners
vim.cmd.packadd("nvim.undotree")
require("oil").setup()

local ts_langs = { "markdown", "markdown_inline", "r", "rnoweb", "yaml", "latex", "csv" }
require("nvim-treesitter").install(ts_langs)

--autopairs
require("nvim-autopairs").setup({
	event = "InsertEnter",
	disable_filetype = { "TelescopePrompt", "vim" },
})

--blink
local blink = require("blink.cmp")
blink.build():wait(60000)
blink.setup()

--theme
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_bold = 1
vim.cmd.colorscheme("gruvbox-material")

--lualine
require("lualine").setup({
	options = {
		theme = "gruvbox-material",
	},
})

--none-ls
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.clang_format,
	},
	on_attach = function(client, bufnr)
		if client:supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

--telescope
local telescope = require("telescope")
telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

telescope.load_extension("ui-select")

--lspconfig
local capabilities = require("blink.cmp").get_lsp_capabilities()
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
		},
	},
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	single_file_support = true,
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})

vim.lsp.config("pylsp", {
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
})

vim.lsp.config("zls", {
	capabilities = capabilities,
})

vim.lsp.config("verible", {
	capabilities = capabilities,
})

vim.lsp.config("r_language_server", {
	capabilities = capabilities,
	settings = {
		filetypes = { "r", "rmd" },
	},
})

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("pylsp")
vim.lsp.enable("zls")
vim.lsp.enable("verible")
vim.lsp.enable("sourcekit-lsp")
vim.lsp.enable("r_language_server")

mason.setup({
	ensure_installed = {
		"clang-format",
		"stylua",
		"clangd",
	},
})

mason_lsp.setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
		"rust_analyzer",
		"pylsp",
	},
})

require("r").setup()
--keybinds
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<F2>", ":set relativenumber!<CR>", opts)
vim.keymap.set("n", "<Home>", ":wa<CR>:qa<CR>", opts)
vim.keymap.set("n", "<End>", ":qa!<CR>")
vim.keymap.set("n", "<Leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ut", ":Undotree<CR>", {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>tf", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>tg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>]", vim.diagnostic.open_float, {})
vim.g.vimtex_view_method = "zathura"
