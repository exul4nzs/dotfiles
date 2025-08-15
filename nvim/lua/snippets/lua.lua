local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Lua for loop
  s("fori", fmt([[
  for {} = {}, {} do
    {}
  end
  ]], {
    i(1, "i"),
    i(2, "1"),
    i(3, "10"),
    i(4, "-- loop body"),
  })),

  -- Lua function
  s("fun", fmt([[
  local function {}({})
    {}
  end
  ]], {
    i(1, "name"),
    i(2, "args"),
    i(3, "-- function body"),
  })),
}
