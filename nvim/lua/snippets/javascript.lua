local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Console log
  s("cl", fmt('console.log("{}", {})', {
    i(1, "log"),
    i(2, "value")
  })),

  -- Arrow function
  s("afn", fmt('const {} = ({}) => {{
  {}
}}', {
    i(1, "functionName"),
    i(2, "params"),
    i(0)
  })),

  -- Promise
  s("prom", fmt([[
  new Promise((resolve, reject) => {{
    {}
  }})
  ]], {
    i(0)
  })),

  -- useEffect hook
  s("uef", fmt([[
  useEffect(() => {{
    {}
  }}, [{}])
  ]], {
    i(1),
    i(2, "")
  }))
}
