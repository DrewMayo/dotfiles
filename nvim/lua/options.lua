vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.wo.relativenumber = false
vim.wo.signcolumn = "yes"
vim.g.python3_host_prog = "/usr/bin/python3"

vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "systemverilog", "verilog" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})
