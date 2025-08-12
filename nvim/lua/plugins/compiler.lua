return {
  {
    "Zeioth/compiler.nvim",
    cmd = {
      "CompilerOpen",       -- Open compiler interface
      "CompilerToggleResults", -- Toggle compiler results window
      "CompilerStop",       -- Force-stop current compilation
    },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
    config = function()
      require("compiler").setup({
        -- Disable task caching (fixes multi-file dirs)
        cache = false,
        -- Define C++23 compilation explicitly
        compilers = {
          cpp = {
            command = "g++",
            args = { "$(FILE)", "-std=c++23", "-o", "$(FILE_NO_EXT)", "-Wall", "-Wextra" },
            -- Optional: Run after successful build
            run = true,
            run_args = { "$(FILE_NO_EXT)" },
          },
        },
      })
    end,
  },

  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1
      },
    },
  },
}
