return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip").config.setup {
        history = true,
        update_events = "TextChanged,TextChangedI",
      }

      -- Load custom Lua snippets from ~/.config/nvim/lua/snippets/
      require("luasnip.loaders.from_lua").lazy_load { paths = "~/.config/nvim/lua/snippets" }

      -- Optionally: load friendly-snippets (vscode-like snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
