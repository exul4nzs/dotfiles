local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Class
  s("class", fmt([[
  class {}
    {}
  end
  ]], {
    i(1, "ClassName"),
    i(0)
  })),

  -- Method
  s("def", fmt([[
  def {}({})
    {}
  end
  ]], {
    i(1, "method_name"),
    i(2, ""),
    i(0)
  })),

  -- Block
  s("do", fmt([[
  do |{}|
    {}
  end
  ]], {
    i(1, "item"),
    i(0)
  })),

  -- RSpec test
  s("describe", fmt([[
  describe '{}' do
    it '{}' do
      {}
    end
  end
  ]], {
    i(1, "ClassName"),
    i(2, "does something"),
    i(0)
  }))
}
