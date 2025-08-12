require "nvchad.autocmds"
<<<<<<< HEAD

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
=======
>>>>>>> 27faf42fcc5bc51571f09cc7aea64aa55b18a3e1
