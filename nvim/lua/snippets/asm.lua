-- ~/.config/nvim/lua/snippets/asm.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- x86_64 function template
  s("func", fmt([[
  .global {}
  {}:
      push %rbp
      mov %rsp, %rbp
      
      {}
      
      mov %rbp, %rsp
      pop %rbp
      ret
  ]], {
    i(1, "function_name"),
    i(1, "function_name"),
    i(0, "# function body"),
  })),

  -- System call template
  s("syscall", fmt([[
  mov ${}, %rax        # syscall number
  {}
  syscall
  ]], {
    i(1, "1"),
    i(0, "# mov arguments to registers"),
  })),

  -- Loop template
  s("loop", fmt([[
  {}:
      {}
      loop {}
  ]], {
    i(1, "loop_label"),
    i(2, "# loop body"),
    i(1, "loop_label"),
  })),

  -- Data section
  s("data", fmt([[
  .section .data
  {}:
      .{} {}
  ]], {
    i(1, "variable_name"),
    i(2, "quad"),
    i(3, "0"),
  })),

  -- BSS section  
  s("bss", fmt([[
  .section .bss
  {}:
      .space {}
  ]], {
    i(1, "buffer_name"),
    i(2, "64"),
  })),

  -- Text section
  s("text", t({
    ".section .text",
    ".global _start",
    "_start:",
  })),

  -- x86_64 registers (quick access)
  s("rax", t("%rax")),
  s("rbx", t("%rbx")),
  s("rcx", t("%rcx")),
  s("rdx", t("%rdx")),
  s("rsi", t("%rsi")),
  s("rdi", t("%rdi")),
  s("rbp", t("%rbp")),
  s("rsp", t("%rsp")),
  s("r8", t("%r8")),
  s("r9", t("%r9")),
  s("r10", t("%r10")),
  s("r11", t("%r11")),
  s("r12", t("%r12")),
  s("r13", t("%r13")),
  s("r14", t("%r14")),
  s("r15", t("%r15")),

  -- 32-bit registers
  s("eax", t("%eax")),
  s("ebx", t("%ebx")),
  s("ecx", t("%ecx")),
  s("edx", t("%edx")),
  s("esi", t("%esi")),
  s("edi", t("%edi")),
  s("ebp", t("%ebp")),
  s("esp", t("%esp")),

  -- Common instructions with operands
  s("mov", fmt("mov {}, {}", { i(1, "src"), i(2, "dst") })),
  s("add", fmt("add {}, {}", { i(1, "src"), i(2, "dst") })),
  s("sub", fmt("sub {}, {}", { i(1, "src"), i(2, "dst") })),
  s("mul", fmt("mul {}", { i(1, "operand") })),
  s("cmp", fmt("cmp {}, {}", { i(1, "op1"), i(2, "op2") })),
  s("test", fmt("test {}, {}", { i(1, "op1"), i(2, "op2") })),

  -- Jump instructions
  s("je", fmt("je {}", { i(1, "label") })),
  s("jne", fmt("jne {}", { i(1, "label") })),
  s("jg", fmt("jg {}", { i(1, "label") })),
  s("jl", fmt("jl {}", { i(1, "label") })),
  s("jmp", fmt("jmp {}", { i(1, "label") })),

  -- Common patterns
  s("pushall", t({
    "push %rax",
    "push %rbx", 
    "push %rcx",
    "push %rdx",
    "push %rsi",
    "push %rdi",
  })),

  s("popall", t({
    "pop %rdi",
    "pop %rsi",
    "pop %rdx",
    "pop %rcx",
    "pop %rbx",
    "pop %rax",
  })),

  -- Hello World template
  s("hello", fmt([[
  .section .data
  msg:
      .ascii "{}\n"
      msg_len = . - msg

  .section .text
  .global _start
  _start:
      # write syscall
      mov $1, %rax        # sys_write
      mov $1, %rdi        # stdout
      mov $msg, %rsi      # message
      mov $msg_len, %rdx  # message length
      syscall
      
      # exit syscall
      mov $60, %rax       # sys_exit
      mov $0, %rdi        # exit status
      syscall
  ]], {
    i(1, "Hello, World!"),
  })),

  -- Stack frame setup
  s("frame", t({
    "push %rbp",
    "mov %rsp, %rbp",
  })),

  -- Stack frame teardown
  s("unframe", t({
    "mov %rbp, %rsp",
    "pop %rbp",
  })),

  -- Comment block
  s("comment", fmt([[
  # {}
  # {}
  ]], {
    i(1, "Function description"),
    i(2, "Additional details"),
  })),
}
