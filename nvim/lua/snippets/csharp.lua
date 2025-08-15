local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Class
  s("class", fmt([[
  public class {} {{
      {}
  }}
  ]], {
    i(1, "ClassName"),
    i(0)
  })),

  -- Main method
  s("main", fmt([[
  public static void Main(string[] args) {{
      {}
  }}
  ]], {
    i(0)
  })),

  -- Property
  s("prop", fmt([[
  public {} {} {{ get; set; }}
  ]], {
    i(1, "string"),
    i(2, "PropertyName")
  })),

  -- Lambda
  s("lambda", fmt("({}) => {}", {
    i(1, "x"),
    i(2, "x")
  }))
}
