-- ~/.config/nvim/lua/snippets/c.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main function
  s("main", fmt([[
  int main(int argc, char** argv) {{
      {}
      return 0;
  }}
  ]], { i(0) })),

  -- Function
  s("fn", fmt([[
  {} {}({}) {{
      {}
  }}
  ]], {
    i(1, "void"),
    i(2, "function_name"),
    i(3, ""),
    i(4, "// function body"),
  })),

  -- For loop
  s("for", fmt([[
  for ({} {} = {}; {} < {}; ++{}) {{
      {}
  }}
  ]], {
    i(1, "int"),
    i(2, "i"),
    i(3, "0"),
    i(2, "i"),
    i(4, "n"),
    i(2, "i"),
    i(0),
  })),

  -- printf
  s("pf", fmt('printf("{}");', { i(1, "%d\\n") })),

  -- Struct
  s("struct", fmt([[
  struct {} {{
      {}
  }};
  ]], {
    i(1, "name"),
    i(0),
  })),

  -- Include
  s("inc", fmt('#include "{}"', { i(1, "stdio.h") })),
}
