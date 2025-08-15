local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local date = function()
  return os.date "%Y-%m-%d"
end

return {
  -- A simple text snippet
  s("hello", {
    t "Hello, world!",
  }),

  -- A snippet with placeholders
  s("date", {
    t "Today is ",
    i(1, os.date "%Y-%m-%d"),
    t ".",
  }),

  -- A more complex snippet
  s("todo", {
    t { "TODO: ", "" },
    i(1, "description"),
    t { "", "- [ ] " },
    i(0),
  }),

  s("timestamp", {
    f(date),
  }),

  s("email", {
    t "Email: ",
    f(function(args)
      -- Get the text before the cursor
      local line = vim.api.nvim_get_current_line()
      local name = line:match "%S+" or "user"
      return name:lower() .. "@example.com"
    end, {}),
  }),
}
