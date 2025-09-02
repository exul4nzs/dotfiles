require "nvchad.autocmds"

-- LSP hover only after idle in normal mode
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.lsp.buf.hover()
  end,
})

-- LSP signature help only after idle in insert mode
vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    vim.lsp.buf.signature_help()
  end,
})

-- Assembly filetype detection and configuration
vim.filetype.add({
  extension = {
    s = "asm",
    S = "asm",
    asm = "asm",
    nasm = "nasm",
  },
  pattern = {
    [".*%.s"] = "asm",
    [".*%.S"] = "asm",
  }
})

-- Assembly-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "asm", "nasm" },
  callback = function()
    local opts = { buffer = true }

    -- Assembly-specific options
    vim.opt_local.iskeyword:append("%") -- Include % in word boundaries for registers
    vim.opt_local.commentstring = "# %s"
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4

    -- Assembly-specific keybindings
    vim.keymap.set('n', '<leader>Ac', ':!as --64 % -o %:r.o<CR>',
      vim.tbl_extend("force", opts, { desc = "Assemble current file" }))
    vim.keymap.set('n', '<leader>Al', ':!as --64 % -o %:r.o && ld %:r.o -o %:r<CR>',
      vim.tbl_extend("force", opts, { desc = "Assemble and link" }))
    vim.keymap.set('n', '<leader>Ad', ':!objdump -d %:r.o<CR>',
      vim.tbl_extend("force", opts, { desc = "Disassemble object file" }))
    vim.keymap.set('n', '<leader>As', ':!nm %:r.o<CR>',
      vim.tbl_extend("force", opts, { desc = "Show symbol table" }))
    vim.keymap.set('n', '<leader>Ar', ':!./%:r<CR>',
      vim.tbl_extend("force", opts, { desc = "Run assembled program" }))
  end,
})
