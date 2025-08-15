  return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null_ls"

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.htmlhint,
      },
    }
  end,
}
