local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Basic HTML5 template
  s("html5.b", fmt([[
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{}</title>
    <link rel="stylesheet" href="{}">
  </head>
  <body>
    {}
  </body>
  </html>
  ]], {
    i(1, "Document"),
    i(2, "styles.css"),
    i(0)
  })),

  -- Div with class
  s("div", fmt('<div class="{}">{}</div>', {
    i(1, "container"),
    i(0)
  })),

  -- Image tag
  s("img", fmt('<img src="{}" alt="{}">', {
    i(1, "image.jpg"),
    i(2, "description")
  }))
}
