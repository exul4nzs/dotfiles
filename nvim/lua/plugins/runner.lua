return {
  {
    "MarcHamamji/runner.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("runner").setup {
        -- General settings
        focus = true,
        position = "bottom",
        height = 10,
        width = 80,
        start_in_insert = true,

        -- Filetype-specific commands (all handle spaces in paths)
        filetype = {
          -- Python
          python = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "python " .. filepath
          end,

          -- JavaScript/Node.js
          javascript = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "node " .. filepath
          end,

          typescript = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "npx ts-node " .. filepath
          end,

          -- Java
          java = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            local filename = vim.fn.expand "%:t:r"
            return "javac " .. filepath .. " && java " .. filename
          end,

          -- C/C++
          c = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            local output = vim.fn.shellescape(vim.fn.expand "%:r")
            return "gcc " .. filepath .. " -o " .. output .. " && " .. output
          end,

          cpp = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            local output = vim.fn.shellescape(vim.fn.expand "%:r")
            return "g++ " .. filepath .. " -o " .. output .. " && " .. output
          end,

          -- Rust
          rust = function()
            local dir = vim.fn.shellescape(vim.fn.expand "%:p:h")
            return "cd " .. dir .. " && cargo run"
          end,

          -- Go
          go = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "go run " .. filepath
          end,

          -- Ruby
          ruby = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "ruby " .. filepath
          end,

          -- PHP
          php = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "php " .. filepath
          end,

          -- R
          r = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "Rscript " .. filepath
          end,

          -- Haskell
          haskell = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "runhaskell " .. filepath
          end,

          -- Shell scripts
          sh = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "bash " .. filepath
          end,

          bash = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "bash " .. filepath
          end,

          -- Lua
          lua = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "lua " .. filepath
          end,

          -- HTML (open in Zen browser)
          html = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "zen-browser " .. filepath .. " &"
          end,

          -- Markdown (open in Zen browser)
          markdown = function()
            local filepath = vim.fn.shellescape(vim.fn.expand "%:p")
            return "zen-browser " .. filepath .. " &"
          end,
        },

        -- Fallback command for unknown filetypes
        default = function()
          return "echo 'No runner configured for this filetype'"
        end,
      }
    end,
  },
  {
    "michaelb/sniprun",
    event = "VeryLazy",
    branch = "master",

    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require("sniprun").setup {
        -- your options
      }
    end,
  },
}
