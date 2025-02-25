vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<F2>", ":set relativenumber!<CR>", opts)
vim.keymap.set("n", "<Home>", ":wa<CR>:qa<CR>", opts)
vim.keymap.set("n", "<End>", ":qa!<CR>")
vim.keymap.set("n", "<Leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-y>", "+y", { noremap = false })
vim.keymap.set("n", "<C-p>", "+p", { noremap = false })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>tf", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>tg", require("telescope.builtin").live_grep, {})
