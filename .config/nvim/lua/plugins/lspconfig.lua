local plugins = {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        single_file_support = true,
      })
      require 'lspconfig'.pylsp.setup {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { 'W391' },
                maxLineLength = 100
              }
            }
          }
        }
      }
      require("lspconfig").rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
            },
          },
        },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "williamboman/mason.nvim",
    ensure_installed = {
      "clang-format",
      "stylua"
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "lopi-py/luau-lsp.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup_handlers({
        luau_lsp = function()
          require("luau-lsp").setup({
            server = {
              filetypes = { "luau" },
              settings = {
                ["luau-lsp"] = {
                  capabilities = capabilities,
                  completion = {
                    imports = {
                      enabled = true,
                    },
                  },
                },
              },
            },
          })
        end,
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "luau_lsp",
          "clangd",
          "rust_analyzer",
          "pylsp"
        },
      })
    end,
  },
}
return plugins
