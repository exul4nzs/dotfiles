local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Function
  s("fun", fmt([[
  {} <- function({}) {{
    {}
  }}
  ]], {
    i(1, "result"),
    i(2, "args"),
    i(0)
  })),

  -- ggplot
  s("gg", fmt([[
  ggplot(data = {}, aes(x = {}, y = {})) +
    geom_{}() +
    {}
  ]], {
    i(1, "data"),
    i(2, "x_var"),
    i(3, "y_var"),
    i(4, "point"),
    i(0)
  })),

  -- Pipe operator
  s("pipe", fmt("{} %>%\n  {}", {
    i(1, "data"),
    i(0)
  })),

  -- Model
  s("lm", fmt("lm({} ~ {}, data = {})", {
    i(1, "y"),
    i(2, "x"),
    i(3, "data")
  }))
}
