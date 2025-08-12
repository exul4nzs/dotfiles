return {
  "glacambre/firenvim",
  lazy = false,  -- Load immediately (required for browser integration)
  build = function()
    vim.fn["firenvim#install"](0)  -- Run install script
  end,
  config = function()
    -- Firenvim config: never take over automatically
    vim.g.firenvim_config = {
      globalSettings = {
        alt = "all",
      },
      localSettings = {
        [".*"] = {
          takeover = "never", -- never attach automatically
        },
      },
    }

    -- Optional: you can set a smaller UI size when manually triggered
    vim.api.nvim_create_autocmd("UIEnter", {
      callback = function()
        if vim.g.started_by_firenvim then
          vim.o.laststatus = 0 -- example: hide statusline in browser
        end
      end,
    })
  end,
}
