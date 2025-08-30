local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Snippet for a basic Javadoc comment
  s(
    "javadoc",
    fmt(
      [[
    /**
     * {}
     *
     * @param {} {}
     * @return {}
     */
  ]],
      {
        i(1, "A brief description of the function."),
        i(2, "parameter"),
        i(3, "description"),
        i(4, "description of return value"),
      }
    )
  ),

  -- Snippet for a class Javadoc comment
  s(
    "classdoc",
    fmt(
      [[
    /**
     * {}
     *
     * @author {}
     * @version {}
     */
  ]],
      {
        i(1, "A brief description of the class."),
        i(2, "Your Name"),
        i(3, "1.0"),
      }
    )
  ),
}, {
  -- This is the key part: these snippets will only be available in Java files
  type = "autosnippets",
  key = "java_autosnippets",
}
