-- Custom diagnostic icons (preserves virtual text)
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- Error
      [vim.diagnostic.severity.WARN] = "", -- Warning
      [vim.diagnostic.severity.INFO] = "", -- Info
      [vim.diagnostic.severity.HINT] = "󰌶", -- Hint
    },
    priority = 50, -- Lower than marks.nvim (100)
  },
  virtual_text = false, -- Keep IDE-like inline messages
  underline = true, -- Keep underlines
  update_in_insert = false, -- Avoid flickering while typing
}

-- Optional: Colorize icons
vim.cmd [[
  highlight DiagnosticSignError guifg=#ff6c6b guibg=NONE
  highlight DiagnosticSignWarn  guifg=#ecbe7b guibg=NONE
  highlight DiagnosticSignInfo  guifg=#98be65 guibg=NONE
  highlight DiagnosticSignHint  guifg=#a9a1e1 guibg=NONE
]]

 -- require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  omnisharp = {
    handlers = {
      ["textDocument/definition"] = function(...)
        return require("omnisharp_extended").handler(...)
      end,
    },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
  },

  jsonls = {
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },
  intelephense = {},
  tailwindcss = {
    -- exclude a filetype from the default_config
    filetypes_exclude = { "markdown" },
    -- add additional filetypes to the default_config
    filetypes_include = {},
    -- to fully override the default_config, change the below
    -- filetypes = {}
  },
  helm_ls = {},
  vhdl_ls = {},
  ruff = {},

  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
    },
  },
  ruby_lsp = {
    enabled = lsp == "ruby_lsp",
  },
  solargraph = {
    enabled = lsp == "solargraph",
  },
  rubocop = {
    -- If Solargraph and Rubocop are both enabled as an LSP,
    -- diagnostics will be duplicated because Solargraph
    -- already calls Rubocop if it is installed
    enabled = formatter == "rubocop" and lsp ~= "solargraph",
  },
  standardrb = {
    enabled = formatter == "standardrb",
  },
  angularls = {},
  cssls = {},
  jdtls = {},
  ts_ls = {},
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
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  clangd = {
    keys = {
      { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    },
    root_dir = function(fname)
      return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
      )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
        "lspconfig.util"
      ).find_git_ancestor(fname)
    end,
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },

  zls = {
    settings = {
      zls = {
        enable_semantic_tokens = true,
        enable_inlay_hints = true,
        warn_style = true,
        enable_autofix = true,
      }
    }
  }
}


-- vim.lsp.enable(servers)
-- Initialize each LSP server
for server_name, server_config in pairs(servers) do
  lspconfig[server_name].setup {
    on_attach = on_attach, -- NvChad's default on_attach
    capabilities = capabilities, -- NvChad's default capabilities
    settings = server_config.settings or nil,
    cmd = server_config.cmd or nil,
    -- Merge other custom configs
  }
end
-- read :h vim.lsp.config for changing options of lsp servers

setup = {
  hls = function()
    return true
  end,
  gopls = function(_, opts)
    -- workaround for gopls not supporting semanticTokensProvider
    -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
    LazyVim.lsp.on_attach(function(client, _)
      if not client.server_capabilities.semanticTokensProvider then
        local semantic = client.config.capabilities.textDocument.semanticTokens
        client.server_capabilities.semanticTokensProvider = {
          full = true,
          legend = {
            tokenTypes = semantic.tokenTypes,
            tokenModifiers = semantic.tokenModifiers,
          },
          range = true,
        }
      end
    end, "gopls")
    -- end workaround
  end,
  angularls = function()
    LazyVim.lsp.on_attach(function(client)
      --HACK: disable angular renaming capability due to duplicate rename popping up
      client.server_capabilities.renameProvider = false
    end, "angularls")
  end,
  clangd = function(_, opts)
    local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
    require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
    return false
  end,
  jdtls = function()
    return true -- avoid duplicate servers
  end,
  tailwindcss = function(_, opts)
    local tw = LazyVim.lsp.get_raw_config("tailwindcss")
    opts.filetypes = opts.filetypes or {}

    -- Add default filetypes
    vim.list_extend(opts.filetypes, tw.default_config.filetypes)

    -- Remove excluded filetypes
    --- @param ft string
    opts.filetypes = vim.tbl_filter(function(ft)
      return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
    end, opts.filetypes)

    -- Additional settings for Phoenix projects
    opts.settings = {
      tailwindCSS = {
        includeLanguages = {
          elixir = "html-eex",
          eelixir = "html-eex",
          heex = "html-eex",
        },
      },
    }

    -- Add additional filetypes
    vim.list_extend(opts.filetypes, opts.filetypes_include or {})
  end,
  yamlls = function()
    LazyVim.lsp.on_attach(function(client, buffer)
      if vim.bo[buffer].filetype == "helm" then
        vim.schedule(function()
          vim.cmd("LspStop ++force yamlls")
        end)
      end
    end, "yamlls")
  end,
}
