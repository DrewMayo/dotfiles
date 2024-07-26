-- Set the tab width to 2
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

vim.wo.relativenumber = false
vim.wo.signcolumn = "yes"

local opts = { noremap = true, silent = true }

-- Vim keymaps
--
--           Modes
--
--      normal_mode = "n"
--      insert_mode = "i"
--      visual_mode = "v"
--      visual_block_mode = "x"
--      term_mode = "t"
--      command mode = "c"
--

vim.g.mapleader = " "

-- normal
-- window opts
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>s", "<C-w>s", opts)
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<A-v>", "<C-w>v<C-w>l:terminal<CR>i", opts)

vim.keymap.set("n", "<Home>", ":wa<CR>:qa<CR>", opts)
vim.keymap.set("n", "<End>", ":qa!<CR>")

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)

-- enable python provider

vim.g.python3_host_prog = "/usr/bin/python3"
--vim.g.loaded_python3_provider = nil
