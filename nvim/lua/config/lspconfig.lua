local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

lspconfig.dependencies = { "saghen/blink.cmp" }

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
})

lspconfig.pylsp.setup({
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

mason.setup({
  ensure_installed = {
    "clang-format",
    "stylua",
    "clangd",
    "codelldb",
    "cpptools",
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
})
