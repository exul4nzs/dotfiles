local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main function
  s(
    "main~",
    fmt(
      [[
  int main(int argc, char** argv) {{
      {}
      return 0;
  }}
  ]],
      { i(0) }
    )
  ),

  s(
    "class~",
    fmt(
      [[
class {} {{
public:
    {}({}) {}
    ~{}() {}

private:
    {}
}};
]],
      {
        i(1, "ClassName"), -- 1st {}: class name
        i(1, "ClassName"), -- 2nd {}: constructor name (same as class)
        i(2, ""), -- 3rd {}: constructor parameters
        i(3, ""), -- 4th {}: constructor body
        i(1, "ClassName"), -- 5th {}: destructor name (same as class)
        i(4, ""), -- 6th {}: destructor body
        i(5, ""), -- 7th {}: private members
      }
    )
  ),
  -- For loop
  s(
    "for~",
    fmt(
      [[
  for ({} {} = {}; {} < {}; ++{}) {{
      {}
  }}
  ]],
      {
        i(1, "int"),
        i(2, "i"),
        i(3, "0"),
        i(2, "i"),
        i(4, "n"),
        i(2, "i"),
        i(0),
      }
    )
  ),

  -- cout
  s("cout~", fmt('std::cout << "{}" << std::endl;', { i(1, "message") })),

  -- Vector
  s("vec~", fmt("std::vector<{}> {};", { i(1, "int"), i(2, "vec") })),

  -- Include
  s("inc~", fmt("#include <{}>", { i(1, "iostream") })),
}
