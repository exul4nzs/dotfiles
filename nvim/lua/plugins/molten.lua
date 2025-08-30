return {
  {
    "benlubas/molten-nvim",
    build = function()
      -- Ensure requirements are met before build
      if vim.fn.executable("python3") == 1 then
        local venv_python = vim.g.python3_host_prog or "python3"
        vim.fn.system({ venv_python, "-m", "pip", "install", "--upgrade", "pynvim", "jupyter_client" })
        vim.cmd("UpdateRemotePlugins")
      else
        vim.notify("Python3 not found! Molten will not work", vim.log.levels.ERROR)
      end
    end,
    dependencies = {
      "3rd/image.nvim",
      "mfussenegger/nvim-dap" -- Optional for debugging
    },
    init = function()
      -- Keymaps can be set here
      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
    end
  }
}
