-- Add this to your plugins configuration
return {
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-dap",
      "mfussenegger/nvim-jdtls", -- Required for LSP functionality
      "folke/which-key.nvim",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("java").setup()
    end,
  }
}
