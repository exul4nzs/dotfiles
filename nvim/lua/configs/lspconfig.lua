require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  tsserver = {},
  rust_analyzer = {},

  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enableed = false },
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          mccabe = { enabled = false },
          pylsp_mypy = { enabled = false },
          pylsp_black = { enabled = false },
          pylsp_isort = { enabled = false },
        },
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        },
      },
    },
  },


}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
