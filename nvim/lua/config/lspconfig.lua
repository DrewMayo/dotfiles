local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

mason.setup({
    ensure_installed = {
        "clang-format",
        "stylua",
        "clangd",
        "codelldb",
        "cpptools",
        "jdtls",
        "zls",
    },
})

mason_lsp.lazy = false
mason_lsp.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "pylsp",
    },
    automatic_enable = {
        exclude = { "luau_lsp" },
    },
})

-- rust
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

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    filetypes = { "js" },
})

-- c/c++
vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
})

--lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
})

--swift
vim.lsp.config("sourcekit", {
    cmd = { "sourcekit-lsp" },
    capabilities = capabilities,
    filetypes = { "swift", "objc", "objcpp", "c", "cpp" },
})

--python

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

-- systemVerilog/verilog
vim.lsp.config("verible", {
    capabilities = capabilities,
})

-- Zig
vim.lsp.config("zls", {
    capabilities = capabilities,
})

vim.lsp.enable({
    "rust_analyzer",
    "ts_ls",
    "clangd",
    "lua_ls",
    "verible",
    "sourcekit",
    "pylsp",
    "jdtls",
    "zls",
})

require("luau-lsp").setup({
    platform = {
        type = "roblox",
    },
    types = {
        roblox_security_level = "PluginSecurity",
    },
    sourcemap = {
        enabled = true,
        autogenerate = true,
        rojo_project_file = "default.project.json",
        sourcemap_file = "sourcemap.json",
    },
})
