return {
  {
    "mrcjkb/rustaceanvim",
    version = '^6',
    lazy = false,
    
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },

    ft = { 'rust' }, -- Load only for Rust files
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      
      vim.keymap.set(
        "n", 
        "<leader>a",
        function()
          vim.cmd.RustLsp('codeAction')
        end,
        { silent = true, buffer = bufnr }
      )
      
      vim.keymap.set(
        "n",
        "K",
        function()
          vim.cmd.RustLsp({'hover', 'actions'})
        end,
        { silent = true, buffer = bufnr }
      )
    end
  }
}
