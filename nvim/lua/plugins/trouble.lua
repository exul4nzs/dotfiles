-- Define signs before Trouble loads
local function setup_diagnostic_signs()
  vim.diagnostic.config {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "", -- Error
        [vim.diagnostic.severity.WARN]  = "", -- Warning
        [vim.diagnostic.severity.INFO]  = "", -- Info
        [vim.diagnostic.severity.HINT]  = "󰌶", -- Hint
      },
      priority = 50, -- Lower than marks.nvim
    },
    virtual_text = false, -- We already have inline from other plugins
    underline = true,
    update_in_insert = false,
  }

  -- Colors for signs
  vim.cmd [[
    highlight DiagnosticSignError guifg=#ff6c6b guibg=NONE
    highlight DiagnosticSignWarn  guifg=#ecbe7b guibg=NONE
    highlight DiagnosticSignInfo  guifg=#98be65 guibg=NONE
    highlight DiagnosticSignHint  guifg=#a9a1e1 guibg=NONE
  ]]
end

return {
  "folke/trouble.nvim",
  lazy = true, -- ensures signs are ready before LSP/Trouble
  config = function(_, opts)
    setup_diagnostic_signs()

    require("trouble").setup(vim.tbl_deep_extend("force", {
      use_diagnostic_signs = true, -- <== important
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
      keys = {
        ["<esc>"] = "close",
      },
    }, opts))
  end,
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  },
}

