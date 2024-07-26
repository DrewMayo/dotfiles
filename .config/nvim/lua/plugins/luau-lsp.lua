local luau = {
  {
    "lopi-py/luau-lsp.nvim",
    ft = { "luau", "lua" },
    opts = {},
    dependecies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("luau-lsp").setup({
        sourcemap = {
          enabled = true,
          autogenerate = true,
          rojo_project_file = "default.project.json",
        },
        fflags = {
          sync = true,
          override = {
            LuauTarjanChildLimit = 0,
          },
        },
      })
    end,
  },
}
return luau
