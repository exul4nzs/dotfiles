return {
  "Exafunction/codeium.vim",

  enabled = false,
  -- event = 'BufEnter',
  config = function()
    -- disable by default
    vim.g.codeium_disable = 1

    vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true, desc = "Codeium Accept" })
    vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true, desc = "Codeium Clear" })
    vim.keymap.set('i', '<C-]>', function() return vim.fn  end, { expr = true, silent = true, desc = "Codeium Cycle Completions Next" })

    vim.g.codeium_filetypes = {
      markdown = false,
    }

    vim.api.nvim_create_user_command("CodeiumEnable", function()
      vim.g.codeium_disable = 0
      vim.cmd("echo 'Codeium enabled'")
    end, {})
  end
}

