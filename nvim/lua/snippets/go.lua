local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main function
  s("main", fmt([[
  func main() {{
      {}
  }}
  ]], {
    i(0)
  })),

  -- Struct
  s("struct", fmt([[
  type {} struct {{
      {}
  }}
  ]], {
    i(1, "StructName"),
    i(0)
  })),

  -- Function
  s("fn", fmt([[
  func {}({}) {} {{
      {}
  }}
  ]], {
    i(1, "functionName"),
    i(2, "args"),
    i(3, "returnType"),
    i(0)
  })),

  -- Error handling
  s("err", fmt([[
  if err != nil {{
      {}
  }}
  ]], {
    i(0, "return err")
  }))
}
