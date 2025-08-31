return {
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   ft = { "markdown", "codecompanion" },
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  -- },
  -- { 'folke/neodev.nvim', event = "VeryLazy", opts = {} },

  { "brenoprata10/nvim-highlight-colors" },
  { "tpope/vim-projectionist" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          window = {
            mappings = {
              ["<cr>"] = "toggle_node", -- Verify this mapping exists
            },
          },
        },
        window = {
          mappings = {
            ["<cr>"] = "toggle_node", -- Verify this mapping exists
          },
        },
      }
    end,
  },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional - Telescope integration
    },
    config = true,
  },
  { "mfussenegger/nvim-jdtls", ft = { "kotlin", "java" } },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["q"] = "actions.close",
        },
      }
    end,
  },
  { "preservim/vim-pencil",    event = "VeryLazy" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = { enabled = false },
        hover = { enabled = false },
        progress = { enabled = false },
      },
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "oxlint" },
        typescript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescriptreact = { "oxlint" },
        java = { "checkstyle" },
        html = { "htmlhint" },
        cpp = { "trivy" },
        c = { "cpplint" },
        python = { "ruff" },
        lua = { "selene" },
        erb = { "htmlhint" },
        svelte = { "eslint_d" },
        kotlin = { "ktlint" },
        terraform = { "tflint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"
      conform.setup {
        formatters_by_ft = {
          lua = { "stylua" },
          asm = { "asmfmt" },
          nasm = { "asmfmt" },
          gas = { "asmfmt" },
          svelte = { "prettier" },
          astro = { "prettier" },
          cs = { "csharpier" },
          javascript = { "biome" },
          typescript = { "biome" },
          javascriptreact = { "biome" },
          typescriptreact = { "biome" },
          json = { "biome" },
          java = { "clang-format" },
          vue = { "prettier" },
          graphql = { "prettier" },
          php = { "php_cs_fixer" },
          kotlin = { "ktlint" },
          markdown = { "prettier" },
          erb = { "htmlbeautifier" },
          html = { "htmlbeautifier" },
          proto = { "buf" },
          rust = { "rustfmt" },
          yaml = { "yamlfix" },
          toml = { "taplo" },
          css = { "prettier" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          scss = { "prettier" },
          python = { "ruff" },
          sh = { "beautysh" },
          bash = { "beautysh" },
          zsh = { "beautysh" },
          ruby = { "rubocop" },
          r = { "air" },
          go = { "gofmt", "goimports" },
          xml = { "xmllint" },
        },
        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,

          formatters = {
            asmfmt = { timeout_ms = 2000, command = "/home/exul4nzs/Miscellaneous/go/bin/asmfmt" },
            lua_ls = { timeout_ms = 1500 },
            beautysh = { timeout_ms = 1000 },
            ruff = { timeout_ms = 1500 }, -- give ruff enough time
          },
        },
      }

      vim.keymap.set({ "n", "v" }, "<leader>l", function()
        conform.format {
          lsp_fallback = true,
          timeout_ms = 1000,
        }
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    config = function()
      require("treesitter-context").setup {
        max_lines = 5,
      }
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require "illuminate"
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup {
        enable_builtin = true,
        use_local_fs = true,
      }
      vim.cmd [[hi OctoEditable guibg=none]]
      vim.treesitter.language.register("markdown", "octo")
    end,
    keys = {
      { "<leader>O",  "<cmd>Octo<cr>",         desc = "Octo" },
      { "<leader>Op", "<cmd>Octo pr list<cr>", desc = "Octo pr list" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
    lazy = true,
    event = "VeryLazy",
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require "nvim-treesitter.configs"

      configs.setup {
        ensure_installed = {
          "javascript",
          "typescript",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "erlang",
          "heex",
          "eex",
          "kotlin",
          "jq",
          "dockerfile",
          "json",
          "html",
          "terraform",
          "go",
          "tsx",
          "bash",
          "ruby",
          "markdown",
          "java",
          "astro",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-CR>",
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>p"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>ps"] = "@parameter.inner",
            },
          },
        },
      }
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim",   event = "VeryLazy", build = "make" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",

    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive Panel" })
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",

    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive Panel" })
    end,
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
      "zidhuss/neotest-minitest",
      "mfussenegger/nvim-dap",
      "jfpedroza/neotest-elixir",
      "weilbith/neotest-gradle",
      "nvim-neotest/neotest-go",

      "lawrence-laz/neotest-zig",
    },
    opts = {
      adapters = {
        ["rustaceanvim.neotest"] = {},
        ["neotest-zig"] = {},
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
        ["neotest-haskell"] = {},
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          -- rspec_cmd = function()
          --   return vim.tbl_flatten({
          --     "bundle",
          --     "exec",
          --     "rspec",
          --   })
          -- end,
        },
        ["neotest-dotnet"] = {
          -- Here we can set options for neotest-dotnet
        },
      },
    },
    opts = {},
    config = function()
      local neotest = require "neotest"

      local neotest_jest = require "neotest-jest" {
        jestCommand = "npm test --",
      }
      neotest_jest.filter_dir = function(name)
        return name ~= "node_modules" and name ~= "__snapshots__"
      end

      neotest.setup {
        adapters = {
          require "neotest-rspec" {
            rspec_cmd = function()
              return vim.tbl_flatten {
                "bundle",
                "exec",
                "rspec",
              }
            end,
          },
          neotest_jest,
          require "neotest-minitest",
          require "neotest-elixir",
          require "neotest-go",
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 15",
        },
        quickfix = {
          open = false,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        config = function(_, opts)
          local dap = require "dap"
          local dapui = require "dapui"
          dap.set_log_level "INFO"
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open {}
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close {}
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close {}
          end
        end,
      },
      {
        "suketa/nvim-dap-ruby",
        config = function()
          require("dap-ruby").setup()
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = {
            "delve",
          },
        },
      },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "junegunn/fzf",
    event = "VeryLazy",
    build = ":call fzf#install()",
  },
  { "nanotee/zoxide.vim",                      event = "VeryLazy" },
  { "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },
  { "debugloop/telescope-undo.nvim",           event = "VeryLazy" },
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>ft",
        "<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>",
        { desc = "Open FloatTerm" }
      )
      vim.keymap.set("n", "<leader>flt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
      vim.keymap.set("t", "<leader>flt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
    end,
  },
  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    config = function()
      require("unimpaired").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk, { desc = "GitSigns state hunk" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "GitSigns reset hunk" })
          map("v", "<leader>hs", function()
            gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { desc = "GitSigns stage_hunk" })
          map("v", "<leader>hr", function()
            gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { desc = "GitSigns reset_hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "GitSigns stage_buffer" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "GitSigns undo_stage_hunk" })
          map("n", "<leader>hR", gs.reset_buffer, { desc = "GitSigns reset_buffer" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "GitSigns preview_hunk" })
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end, { desc = "GitSigns blame line" })
          map("n", "<leader>htb", gs.toggle_current_line_blame, { desc = "GitSigns toggle blame" })
          map("n", "<leader>hd", gs.diffthis, { desc = "GitSigns diffthis" })
          map("n", "<leader>hD", function()
            gs.diffthis "~"
          end, { desc = "GitSigns diffthis" })
          map("n", "<leader>htd", gs.toggle_deleted, { desc = "GitSigns toggle_deleted" })

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns select hunk" })
        end,
      }
    end,
  },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  { "tpope/vim-rails",        event = "VeryLazy" },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require "mason"
      local mason_tool_installer = require "mason-tool-installer"

      -- enable mason and configure icons
      mason.setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }

      mason_tool_installer.setup {
        ensure_installed = {
          "phpcs",
          "php-cs-fixer",
          "standardrb",
          "prettier",
          "goimports",
          "gofumpt",
          "standardrb",
          "prettier",
          "prettierd",
          "ktlint",
          "eslint_d",
          "google-java-format",
          "htmlbeautifier",
          "beautysh",
          "java-debug-adapter",
          "java-test",
          "css-lsp",
          "tailwindcss-language-server",
          "typescript-language-server",
          "buf",
          "rustfmt",
          "yamlfix",
          "taplo",
          "shellcheck",
          "gopls",
          "delve",
          "astro-language-server",
        },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end,
    opts = {
      triggers = {
        { "<auto>", mode = "nxso" },
      },
    },
  },
  { "nvim-telescope/telescope-live-grep-args.nvim", event = "VeryLazy" },
  {
    "aaronhallaert/advanced-git-search.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {}
    end,
    lazy = false,
  },
  { "bfrg/vim-cpp-modern" },
  { "p00f/clangd_extensions.nvim" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod" },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
    },
    init = function()
      vim.g.db_ui_use_nvim_notify = 1
    end,
    keys = {
      { "<leader>Db",  "<cmd>DBUI<cr>",              desc = "DB UI" },
      { "<leader>Dbc", "<cmd>DBUIAddConnection<cr>", desc = "DB UI Add Connection" },
      { "<leader>Dbf", "<cmd>DBUIFindBuffer<cr>",    desc = "DB UI Find Buffer" },
      { "<leader>Dbn", "<cmd>DBUIRenameBuffer<cr>",  desc = "DB UI Rename Buffer" },
      { "<leader>Dbi", "<cmd>DBUILastQueryInfo<cr>", desc = "DB UI Last Query Info" },
    },
  },
  {
    "nvzone/showkeys",
    event = "VeryLazy",
    opts = {
      timeout = 4,
      maxkeys = 4,
      show_count = true,
    },
    config = function(_, opts)
      require("showkeys").setup(opts)
      vim.cmd "ShowkeysToggle" -- turn it on at startup
    end,
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    -- stylua: ignore
    keys = {
      { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
      { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class",  ft = "python" },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "biome", "gomodifytags", "impl" } },
      },
    },
    opts = function(_, opts)
      local nls = require "null-ls"
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      })
      table.insert(opts.sources, nls.builtins.formatting.biome)
      table.insert(opts.sources, nls.builtins.formatting.csharpier)
    end,
  },
  {
    "nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "angular", "scss" })
      end
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        pattern = { "*.component.html", "*.container.html" },
        callback = function()
          vim.treesitter.start(nil, "angular")
        end,
      })
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function()
      require("clangd_extensions").setup {}
    end,

    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.sorting = opts.sorting or {}
      opts.sorting.comparators = opts.sorting.comparators or {}
      table.insert(opts.sources, { name = "git" })
      table.insert(opts.sorting.comparators, 1, require "clangd_extensions.cmp_scores")
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    ft = { "scala", "sbt" },
    config = function() end,
  },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
  {
    "sitiom/nvim-numbertoggle",
    event = "VeryLazy",
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").save() end,                desc = "Save Session" },
      { "<leader>qr", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>qS", function() require("persistence").select() end,              desc = "Select Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = function()
      ---@type table<string, string[]>|false
      local filter_kind = false

      local opts = {
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "man" },
        show_guides = true,
        layout = {
          resize_to_content = false,
          win_opts = {
            winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
            signcolumn = "yes",
            statuscolumn = " ",
          },
        },
        icons = icons,
        filter_kind = filter_kind,
        -- stylua: ignore
        guides = {
          mid_item   = "├╴",
          last_item  = "└╴",
          nested_top = "│ ",
          whitespace = "  ",
        },
      }
      return opts
    end,
    keys = {
      { "<leader>A", "<cmd>AerialToggle<cr>", desc = "Aerial Outline" },
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      right = {
        {
          ft = "toggleterm",
          size = { width = 0.4 }, -- 40% of screen width
          filter = function(buf, win)
            local config = vim.api.nvim_win_get_config(win)
            -- Target vertical terminals only
            return config.relative == "" and config.width ~= nil
          end,
        },
      },
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          size = { height = 0.3 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "NvChad Terminal",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        { ft = "qf",            title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          title = "Neo-Tree Git",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          collapsed = true, -- show window as closed/collapsed on start
          open = "Neotree position=right git_status",
        },
        {
          title = "Neo-Tree Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          collapsed = true, -- show window as closed/collapsed on start
          open = "Neotree position=top buffers",
        },
        {
          title = function()
            local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
            return vim.fn.fnamemodify(buf_name, ":t")
          end,
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutlineOpen",
        },
        -- any other neo-tree windows
        "neo-tree",
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    opts = {
      -- Override NvChad's default config
      highlights = {
        -- Match NvChad's theme
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
      },
      on_open = function(term)
        -- Set terminal title
        vim.api.nvim_buf_set_name(term.bufnr, "NvChad Terminal")
        -- Optional: Add winbar for visual title
        vim.wo[term.winid].winbar = "  NvChad Terminal "
      end,
    },

    config = function()
      require("toggleterm").setup {
        -- Base configuration (will be overridden by edgy)
        size = 20,
        open_mapping = false,    -- Disable default keybinds (we'll use custom ones)
        shade_terminals = false, -- Let edgy handle borders/styling
        persist_mode = true,     -- Remember terminal content when hidden
      }
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension "ht"
      end
    end,
  },
  { "mrcjkb/neotest-haskell" },
  {
    "mrcjkb/haskell-snippets.nvim",
    dependencies = { "L3MON4D3/LuaSnip" },
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
      local haskell_snippets = require("haskell-snippets").all
      require("luasnip").add_snippets("haskell", haskell_snippets, { key = "haskell" })
    end,
  },
  {
    "luc-tielen/telescope_hoogle",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension "hoogle"
      end
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      manual_mode = true,
    },
    config = function()
      require("project_nvim").setup(opts)
      local history = require "project_nvim.utils.history"
      history.delete_project = function(project)
        for k, v in pairs(history.recent_projects) do
          if v == project.value then
            history.recent_projects[k] = nil
            return
          end
        end
      end -- your configuration comes here
      -- or leave it empty to use the default settings
      -- Load telescope extension after telescope is available
      require("lazy.core.loader").load("telescope.nvim", { reset = false }, function()
        require("telescope").load_extension "projects"
      end)
      -- refer to the configuration section below
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Ensure telescope is available
    },
  },

  {
    "ggandor/flit.nvim",
    enabled = true,
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" } }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },

  -- Leap.nvim
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      {
        "<M-s>",
        mode = { "n" },
        function()
          local leap = require "leap"
          leap.leap { target_windows = require("leap.user").get_focusable_windows() }
        end,
        desc = "Leap from Windows",
      },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(false)
    end,
  },
  { "tpope/vim-repeat",                  event = "VeryLazy" },
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    event = "VeryLazy",
    opts = {
      jump = { autojump = true },
      modes = {
        char = { jump_labels = true, multi_line = false },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<C-s>",
        mode = { "n", "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    opts = {},
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
      require("NeoComposer").setup()
    end,
    opts = {},
  },
  { "mattn/emmet-vim" },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "ziglang/zig.vim",
    ft = "zig",
  },
  {
    "lawrence-laz/neotest-zig",
  },
  { "Vimjas/vim-python-pep8-indent" },
  { "yioneko/nvim-vtsls" },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "leoluz/nvim-dap-go",
    },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup {
        gofmt = "gofumpt", -- use gofumpt
        lsp_gofumpt = true,
        dap_debug = true,  -- enable nvim-dap-go
      }

      -- Autoformat before save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports() -- or gofmt()
        end,
        group = vim.api.nvim_create_augroup("GoFormat", {}),
      })

      -- Load dap-go after go.nvim
      require("dap-go").setup()
    end,
  },
  {
    "olexsmir/gopher.nvim", -- Go-specific tools
    ft = "go",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
        },
      }
      -- Keymaps that'll make you #180 happy
      vim.keymap.set("n", "<leader>gt", "<cmd>GoTagAdd json<cr>", { desc = "[G]o [T]ag (json)" })
      vim.keymap.set("n", "<leader>gT", "<cmd>GoTagRemove json<cr>", { desc = "[G]o [T]ag remove" })
      vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<cr>", { desc = "[G]o [I]mplement" })
    end,
  },

  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        -- Optional: Customize TrueZen's behavior (minimal setup works fine)
        modes = {
          ataraxis = {     -- Distraction-free mode (used by Neorg presenter)
            padding = {
              left = 0.15, -- Adjust padding if needed
            },
          },
        },
      }
    end,
  },
  {
    "nvim-neorg/neorg-telescope", -- Add this dependency
    dependencies = {
      "nvim-neorg/neorg",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "natebosch/vim-lsc",
  },

  {
    "vlime/vlime",
    config = function()
      rtp = "vim/"
    end,
  },
  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup {
        root_key = "S",
      }
    end,
  },
}
