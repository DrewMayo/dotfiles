--[[local luautree = {
  "zilibobi/luau-tree.nvim",
  config = function()
    local config = require("luau-tree.config")

    config.host = "127.0.0.1"
    config.port = 3667

    config.enabled = true
    local hook = config:hook("enabled", function(value)
      print(tostring(value) .. " is the new value of 'enabled'.")
    end)

    hook:unhook()
  end,
}
return luautree]]

return {}
