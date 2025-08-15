local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main guard
  s("main", fmt([[
  if __name__ == "__main__":
      {}
  ]], { i(0) })),

  -- Function
  s("def", fmt([[
  def {}({}):
      {}
  ]], {
    i(1, "function_name"),
    i(2, "args"),
    i(3, "pass"),
  })),

  -- Class
  s("class", fmt([[
  class {}:
      def __init__(self{}):
          {}
  ]], {
    i(1, "ClassName"),
    i(2, ""),
    i(3, "pass"),
  })),

  -- Print
  s("pp", fmt('print(f"{}")', { i(1, "message") })),

  -- For loop
  s("for", fmt([[
  for {} in {}:
      {}
  ]], {
    i(1, "item"),
    i(2, "iterable"),
    i(3, "pass"),
  })),

  -- Try/except
  s("try", fmt([[
  try:
      {}
  except {} as {}:
      {}
  ]], {
    i(1, "# code that might raise exception"),
    i(2, "Exception"),
    i(3, "e"),
    i(4, "# handle exception"),
  })),
}
