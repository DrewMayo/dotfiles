local luasnip = require("LuaSnip")
luasnip.tag = "v2.*"
luasnip.build = "make install_jsregexp"
require("luasnip.loaders.from_vscode").lazy_load()
