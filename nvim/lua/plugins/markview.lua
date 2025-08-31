-- For `plugins/markview.lua` users.
return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    cmd = {
      "LspUI hover",
    },
    -- For `nvim-treesitter` users.
    priority = 49,

    -- For blink.cmp's completion
    -- source
    dependencies = {
      "saghen/blink.cmp",
    },
  },
  {
    "jinzhongjia/LspUI.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig", -- ensure LSP loads first
    },
    branch = "main",
    config = function()
      require("LspUI").setup {
        -- General settings
        prompt = {
          border = true,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },

        -- Code Action configuration
        code_action = {
          enable = true,
          command_enable = true,
          gitsigns = false,
          extend_gitsigns = false,
          ui = {
            title = "Code Action",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },

        -- Hover configuration
        hover = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Hover",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
          },
        },

        -- Rename configuration
        rename = {
          enable = true,
          command_enable = true,
          auto_save = false,
          ui = {
            title = "Rename",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "<C-c>",
            exec = "<CR>",
          },
        },

        -- Diagnostic configuration
        diagnostic = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Diagnostic",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },

        -- Definition configuration
        definition = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Definition",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
          },
        },

        -- Reference configuration
        reference = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Reference",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
          },
        },

        -- Implementation configuration
        implementation = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Implementation",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
          },
        },

        -- Type Definition configuration
        type_definition = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Type Definition",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
          },
        },

        -- Declaration configuration
        declaration = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Declaration",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
          },
        },

        -- Call Hierarchy configuration
        call_hierarchy = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Call Hierarchy",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
            exec = "<CR>",
            expand = "o",
            jump = "e",
            vsplit = "v",
            split = "s",
            tabe = "t",
          },
        },

        -- Lightbulb configuration
        lightbulb = {
          enable = true,
          command_enable = true,
          icon = "💡",
          action_kind = {
            QuickFix = "🔧",
            Refactor = "♻️",
            RefactorExtract = "📤",
            RefactorInline = "📥",
            RefactorRewrite = "✏️",
            Source = "📄",
            SourceOrganizeImports = "📦",
          },
        },

        -- Inlay Hint configuration
        inlay_hint = {
          enable = true,
          command_enable = true,
        },

        -- Signature Help configuration
        signature = {
          enable = true,
          command_enable = true,
          ui = {
            title = "Signature Help",
            border = "rounded",
            winblend = 0,
          },
          keys = {
            quit = "q",
          },
        },
      }

      -- Basic keybinding setup for LspUI
      vim.keymap.set("n", "K", "<cmd>LspUI hover<CR>")
      vim.keymap.set("n", "gr", "<cmd>LspUI reference<CR>")
      vim.keymap.set("n", "gd", "<cmd>LspUI definition<CR>")
      vim.keymap.set("n", "gt", "<cmd>LspUI type_definition<CR>")
      vim.keymap.set("n", "gi", "<cmd>LspUI implementation<CR>")
      vim.keymap.set("n", "<leader>rn", "<cmd>LspUI rename<CR>")
      vim.keymap.set("n", "<leader>ca", "<cmd>LspUI code_action<CR>")
      vim.keymap.set("n", "<leader>ci", "<cmd>LspUI call_hierarchy incoming_calls<CR>")
      vim.keymap.set("n", "<leader>co", "<cmd>LspUI call_hierarchy outgoing_calls<CR>")
    end,
  },
}
