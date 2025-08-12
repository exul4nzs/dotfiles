return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  branch = "v3.x",
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>N",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Toggle Neotree",
    },
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


    -- Add robust error handling for toggle_node
    vim.api.nvim_create_autocmd("User", {
      pattern = "NeoTreeSetup",
      callback = function()
        local commands = require("neo-tree.sources.filesystem.commands")
        local original_toggle = commands.toggle_node

        commands.toggle_node = function(state)
          -- 1. Verify state exists
          if not state then
            vim.notify("Neo-tree: Invalid state", vim.log.levels.ERROR)
            return
          end

          -- 2. Verify tree exists
          if not state.tree then
            vim.notify("Neo-tree: Tree not initialized - refreshing...", vim.log.levels.WARN)
            require("neo-tree").focus()
            return
          end

          -- 3. Verify window exists
          local window_ok, _ = pcall(vim.api.nvim_win_get_buf, state.winid)
          if not window_ok then
            vim.notify("Neo-tree: Window closed - reopening...", vim.log.levels.WARN)
            require("neo-tree").focus()
            return
          end

          -- If all checks pass, call original function
          return original_toggle(state)
        end
      end,
    })
  end
}
