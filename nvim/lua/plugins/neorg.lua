return {
  "nvim-neorg/neorg",
  ft = "norg", -- Lazy-load only for .norg files (faster startup)
  cmd = "Neorg", -- Also load when running :Neorg commands
  version = "*", -- Latest stable release
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required
    "nvim-treesitter/nvim-treesitter", -- For syntax highlighting
    "folke/zen-mode.nvim", -- For distraction-free writing (optional but awesome)
    "nvim-neorg/neorg-gtd",
  },
  config = function()
    require("neorg").setup({
      load = {
        -- Core modules (MUST-HAVES)
        ["core.defaults"] = {}, -- Essential defaults
        ["core.concealer"] = { -- Pretty icons and formatting
          config = {
            icon_preset = "diamond",
            folds = true,
          },
        },
        ["core.dirman"] = { -- Manage workspaces
          config = {
            workspaces = {
              notes = "~/neorg/notes", -- Default workspace
              work = "~/neorg/work",   -- Add more as needed
            },
            default_workspace = "notes",
          },
        },

        -- Productivity boosters
        ["core.integrations.telescope"] = {}, -- Fuzzy find notes
        ["core.keybinds"] = { -- Custom keybinds
          config = {
            default_keybinds = true,
            neorg_leader = "<Leader>n", -- Leader prefix for Neorg
          },
        },
        ["core.journal"] = { -- Daily notes/journaling
          config = {
            workspace = "notes",
            journal_folder = "journal",
          },
        },
        ["core.export"] = {}, -- Export to Markdown/HTML/etc
        ["core.export.markdown"] = { -- Enhanced Markdown export
          config = {
            extensions = "all",
          },
        },

        -- Optional but killer features
        ["core.presenter"] = { -- Presentation mode!
          config = {
            zen_mode = "truezen",
          },
        },
        ["core.integrations.nvim-cmp"] = {}, -- Autocompletion
        ["core.gtd.base"] = { -- Getting Things Done workflow
          config = {
            workspace = "work",
          },
        },
      },
    })

    -- Custom keymaps for quick access
    vim.keymap.set("n", "<Leader>no", ":Neorg workspace notes<CR>", { silent = true, desc = "Open Neorg Notes" })
    vim.keymap.set("n", "<Leader>nj", ":Neorg journal today<CR>", { silent = true, desc = "Today's Journal" })
    vim.keymap.set("n", "<Leader>np", ":Neorg presenter start<CR>", { silent = true, desc = "Start Presentation" })
  end,
}
