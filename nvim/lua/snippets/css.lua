local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Flexbox container
  s("flex", fmt([[
  .{} {{
    display: flex;
    justify-content: {};
    align-items: {};
    {}
  }}
  ]], {
    i(1, "container"),
    i(2, "center"),
    i(3, "center"),
    i(0)
  })),

  -- CSS Grid
  s("grid", fmt([[
  .{} {{
    display: grid;
    grid-template-columns: {};
    gap: {};
    {}
  }}
  ]], {
    i(1, "grid-container"),
    i(2, "repeat(auto-fill, minmax(250px, 1fr))"),
    i(3, "1rem"),
    i(0)
  })),

  -- Media query
  s("media", fmt([[
  @media (max-width: {}px) {{
    {}
  }}
  ]], {
    i(1, "768"),
    i(0)
  }))
}
