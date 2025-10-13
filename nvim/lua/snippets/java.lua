local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Snippet for a basic Javadoc comment
  s(
    "javadoc", fmt(
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


  -- Snippet for multiple else-if statements
  s(
    "ifelseif",
    fmt(
      [[
if ({}) {{
  {}
}} else if ({}) {{
  {}
}} else if ({}) {{
  {}
}} else {{
  {}
}}
{}
]],
      {
        i(1, "condition"),
        i(2, "// code"),
        i(3, "condition"),
        i(4, "// code"),
        i(5, "condition"),
        i(6, "// code"),
        i(7, "// code"),
        i(0),
      }
    )
  ),
  -- Snippet for System.out.print
  s(
    "print",
    fmt([[System.out.print({});]], {
      i(1, '"text"'),
    })
  ),

  -- Snippet for System.out.printf
  s(
    "printf",
    fmt([[System.out.printf({}, {});]], {
      i(1, '"format"'),
      i(2, "args"),
    })
  ),

}, {
  -- This is the key part: these snippets will only be available in Java files
  type = "autosnippets",
  key = "java_autosnippets",
}
