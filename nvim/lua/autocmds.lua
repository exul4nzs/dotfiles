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
