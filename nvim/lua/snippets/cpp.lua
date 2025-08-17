local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main function
  s(
    "main~",
    fmt(
      [[
  int main(int argc, char** argv) {{
      {}
      return 0;
  }}
  ]],
      { i(0) }
    )
  ),

  s(
    "class~",
    fmt(
      [[
class {} {{
public:
    {}({}) {}
    ~{}() {}

private:
    {}
}};
]],
      {
        i(1, "ClassName"), -- 1st {}: class name
        i(1, "ClassName"), -- 2nd {}: constructor name (same as class)
        i(2, ""),          -- 3rd {}: constructor parameters
        i(3, ""),          -- 4th {}: constructor body
        i(1, "ClassName"), -- 5th {}: destructor name (same as class)
        i(4, ""),          -- 6th {}: destructor body
        i(5, ""),          -- 7th {}: private members
      }
    )
  ),
  -- For loop
  s(
    "for~",
    fmt(
      [[
  for ({} {} = {}; {} < {}; ++{}) {{
      {}
  }}
  ]],
      {
        i(1, "int"),
        i(2, "i"),
        i(3, "0"),
        i(2, "i"),
        i(4, "n"),
        i(2, "i"),
        i(0),
      }
    )
  ),

  -- cout
  s("cout~", fmt('std::cout << "{}" << std::endl;', { i(1, "message") })),

  -- Vector
  s("vec~", fmt("std::vector<{}> {};", { i(1, "int"), i(2, "vec") })),

  -- Include
  s("inc~", fmt("#include <{}>", { i(1, "iostream") })),



  -- ======== OOP SNIPPETS ======== --
  -- Constructor with initializer list
  s(
    "ctor~",
    fmt(
      [[
{}({}) : {} {{
    {}
}}
]],
      {
        i(1, "ClassName"),
        i(2, ""),
        i(3, ""), -- Initializer list (e.g., "member1(value1), member2(value2)")
        i(0),     -- Constructor body
      }
    )
  ),

  -- Getter method
  s(
    "get~",
    fmt(
      [[
{} get{}() const {{
    return {};
}}
]],
      {
        i(1, "int"),
        i(2, "VarName"),
        i(3, "m_var"),
      }
    )
  ),


  -- Setter method
  s(
    "set~",
    fmt(
      [[
void set{}(const {}& {}) {{
    {} = {};
}}
]],
      {
        i(1, "VarName"),
        i(2, "int"),
        i(3, "value"),
        i(4, "m_var"),
        i(3, "value"),
      }
    )
  ),



  -- Inheritance (class declaration)
  s(
    "inherits~",
    fmt(
      [[
class {} : public {} {{
public:
    // ...
}};
]],
      {
        i(1, "DerivedClass"),
        i(2, "BaseClass"),
      }
    )
  ),


  -- Polymorphic base class (with virtual destructor)
  s(
    "polybase~",
    fmt(
      [[
class {} {{
public:
    virtual ~{}() = default;
    // ...
}};
]],
      {
        i(1, "BaseClass"),
        i(1, "BaseClass"),
      }
    )
  ),


  -- ====== CORE OOP ====== --
  -- RAII: Smart pointer (unique_ptr)
  s("uptr~", fmt("std::unique_ptr<{}> {};", { i(1, "ClassName"), i(2, "ptr") })),

  -- RAII: Smart pointer (shared_ptr)
  s("sptr~", fmt("std::shared_ptr<{}> {};", { i(1, "ClassName"), i(2, "ptr") })),


  -- Interface (Pure Virtual Class)
  s("interface~", fmt([[
class {1} {{
public:
    virtual ~{1}() = default;
    virtual {2} {3}({4}) {5} = 0;
}};
]], { i(1, "InterfaceName"), i(2, "void"), i(3, "method"), i(4, ""), i(5, "const") })),




  -- ====== POLYMORPHISM ====== --
  -- Virtual function
  s(
    "virtual~",
    fmt(
      [[
virtual {} {}({}) {} {{
    {}
}}
]],
      {
        i(1, "void"),
        i(2, "func"),
        i(3, ""),
        i(4, "const"),
        i(0),
      }
    )
  ),

  -- Override (C++11 style)
  s("override~", fmt("{} {}({}) override {} {{\n    {}\n}}",
    { i(1, "void"), i(2, "func"), i(3, ""), i(4, "const"), i(0) })),


  -- ====== ENCAPSULATION ====== --
  -- Getter/Setter Pair
  s("gs~", fmt([[
{1} get{2}() const {{ return m_{3}; }}
void set{2}(const {1}& {3}) {{ m_{3} = {3}; }}
]], { i(1, "int"), i(2, "VarName"), i(3, "var") })),



  -- PImpl Idiom (Pointer to Implementation)
  s("pimpl~", fmt([[
// {1}.h
class {1} {{
public:
    {1}();
    ~{1}();
private:
    class Impl;
    std::unique_ptr<Impl> pImpl;
}};

// {1}.cpp
class {1}::Impl {{
    // Hidden implementation
}};

{1}::{1}() : pImpl(std::make_unique<Impl>()) {{}}
{1}::~{1}() = default;
]], { i(1, "ClassName") })),


  -- ====== DESIGN PATTERNS ====== --
  -- Singleton
  s("singleton~", fmt([[
class {1} {{
public:
    static {1}& getInstance() {{
        static {1} instance;
        return instance;
    }}
    {1}(const {1}&) = delete;
    void operator=(const {1}&) = delete;
private:
    {1}() {{}}
}};
]], { i(1, "Singleton") })),

  -- Factory Method
  s("factory~", fmt([[
class {1} {{
public:
    static std::unique_ptr<{1}> create({2}) {{
        return std::make_unique<{1}>({3});
    }}
}};
]], { i(1, "Product"), i(2, ""), i(3, "") })),

  -- Observer Pattern
  s("observer~", fmt([[
#include <memory>
#include <vector>

class Observer {{
public:
    virtual ~Observer() = default;
    virtual void update() = 0;
}};

class {1} {{
public:
    void attach(std::shared_ptr<Observer> obs) {{
        observers_.push_back(obs);
    }}

    void notify() {{
        for (auto& weak_obs : observers_) {{
            if (auto obs = weak_obs.lock()) {{
                obs->update();  // Now safe to call
            }}
        }}
    }}

private:
    std::vector<std::weak_ptr<Observer>> observers_;
}};
]], { i(1, "Subject") })),

  -- ====== UTILITIES ====== --
  -- Range-based for loop (C++11)
  s("forr~", fmt([[
for (const auto& {} : {}) {{
    {}
}}
]], { i(1, "item"), i(2, "container"), i(0) })),


  -- Lambda Function
  s("lambda~", fmt([[
auto {} = [{}]({}) {{
    {}
}};
]], { i(1, "func"), i(2, ""), i(3, ""), i(0) })),
}
