vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_hl(0, "NoicePopup", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoicePopupBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoiceLspProgressSpinner", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoiceLspProgressTitle", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NoicePopup", { bg = "NONE" })

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
  -- Add these with explicit event triggers
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 3,
        patterns = {
          default = {
            'class', 'function', 'method',
          },
        },
      })
    end
  }
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)


