return {
  "folke/which-key.nvim",
  lazy = false,
  init = function()
    vim.opt.timeoutlen = 100
  end,
  config = function()
    require("which-key").setup()
  end,
}
