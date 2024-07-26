local whichkey = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>t",  group = "Telescope" },
        { "<leader>tf", desc = "Find Files" },
        { "<leader>tg", desc = "Live Grep" },
        { "<leader>c",  group = "Code" },
        { "<leader>ca", desc = "Code Actions" },
        { "<leader>g",  group = "Formatting" },
        { "<leader>gf", desc = "Format" },
        { "gd",         desc = "Get Definition" },
        { "K",          desc = "hover" },
      })
    end,
  },
}

return whichkey
