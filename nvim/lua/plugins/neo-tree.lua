return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  branch = "v3.x",
  keys = {
    -- I'm using these 2 keyamps already with mini.files, so avoiding conflict
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>r",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        -- Function to check if NeoTree is open in any window
        local function is_neo_tree_open()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree" then
              return true
            end
          end
          return false
        end
        -- Check if the current file exists
        if vim.fn.filereadable(buf_name) == 1 or vim.fn.isdirectory(vim.fn.fnamemodify(buf_name, ":p:h")) == 1 then
          if is_neo_tree_open() then
            -- Close NeoTree if it's open
            vim.cmd("Neotree close")
          else
            -- Open NeoTree and reveal the current file
            vim.cmd("Neotree reveal")
          end
        else
          -- If the file doesn't exist, execute the logic for <leader>R
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end
      end,
      desc = "[P]Toggle current file in NeoTree or open cwd if file doesn't exist",
    },
    {
      "<leader>en",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree",
    },

    -- {
    --   "<leader>r",
    --   function()
    --     vim.cmd("Neotree reveal")
    --   end,
    --   desc = "Reveal current file in NeoTree",
    -- },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem",  display_name = " File" },
          { source = "buffers",     display_name = " Bufs" },
          { source = "git_status",  display_name = " Git" },
        },
      },
    })
  end
}
