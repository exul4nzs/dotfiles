return {
  {
    'developedbyed/marko.nvim',
    lazy = false,
    config = function()
      require('marko').setup({
        -- Popup window dimensions
        width = 100,
        height = 100,

        -- Border style: 'rounded', 'single', 'double', 'solid', 'shadow'
        border = "rounded",

        -- Popup title
        title = " Marks ",

        -- Default keymap to open popup (set to false to disable)
        default_keymap = '"',

        -- Navigation mode: "popup" (default) or "direct" (jump directly to marks)
        navigation_mode = "popup",

        -- Key mappings within popup
        -- Can be a single key (string) or multiple keys (table of strings)
        keymaps = {
          delete ="d",
          close = { "<Esc>", "q" },
        },

        -- Direct mode configuration
        direct_mode = {
          mode_toggle_key = "<leader>mm", -- Key to toggle modes
        },

        -- Show marks from all buffers or just current buffer
        show_all_buffers = false,

        -- Exclude certain marks from display
        exclude_marks = { "'", "`", "^", ".", "[", "]", "<", ">" },

        -- Virtual text configuration
        virtual_text = {
          enabled = false,        -- Enable virtual text marks
          icon = "●",           -- Icon to display
          hl_group = "Comment", -- Highlight group
          position = "eol",     -- Position: "eol" or "overlay"
        },
      })  end,

  },
  {
    'chentoast/marks.nvim',
    lazy = false,
    config = function()
      require('marks').setup({
        -- Configure signs for built-in marks (a-z, A-Z, 0-9, etc.)
        signs = {
          lower = { text = '●', texthl = 'MarkSignHL', priority = 100},
          upper = { text = '◆', texthl = 'MarkSignHL', priority = 100 },
          builtin = { text = '⌘', texthl = 'MarkSignHL', priority = 100 },
        },
        -- Exclude marko's marks from cluttering the sign column
        excluded_filetypes = { 'marko' }, -- Optional
      })
    end,
  },
}
