local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main function
  s("main", fmt([[
  fn main() {{
      {}
  }}
  ]], { i(0) })),

  -- Function
  s("fn", fmt([[
  fn {}({}) {} {{
      {}
  }}
  ]], {
    i(1, "function_name"),
    i(2, ""),
    i(3, ""),
    i(4, "todo!()"),
  })),

  -- Struct
  s("struct", fmt([[
  struct {} {{
      {}
  }}
  ]], {
    i(1, "Name"),
    i(0),
  })),

  -- impl block
  s("impl", fmt([[
  impl {} {{
      {}
  }}
  ]], {
    i(1, "StructName"),
    i(0),
  })),

  -- Test
  s("test", fmt([[
  #[test]
  fn {}() {{
      {}
  }}
  ]], {
    i(1, "test_name"),
    i(0),
  })),

  -- println!
  s("pl", fmt('println!("{}");', { i(1, "message") })),
}
