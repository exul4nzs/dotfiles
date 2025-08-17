return {
  "VonHeikemen/lsp-zero.nvim",
  event = "VeryLazy",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {                            -- Optional
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "saghen/blink.nvim" },   -- Primary completion engine
    { "hrsh7th/nvim-cmp" },    -- Only for cmdline completion
    { "hrsh7th/cmp-cmdline" }, -- Cmdline source
    { "L3MON4D3/LuaSnip" },    -- Required for snippets
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    -- Force-clear any existing signs
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.fn.sign_unplace "*"
      end,
      once = true,
    })

    local lsp = require "lsp-zero"

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gr", function()
        vim.lsp.buf.references()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))
      vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))
      vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.setloclist()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
      end, vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
      end, vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))
      vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))
      vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))
      vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))
      vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
    end)

    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = {
        "eslint",
        "helm_ls",
        "rust_analyzer",
        "kotlin_language_server",
        "jdtls",
        "lua_ls",
        "jsonls",
        "html",
        "elixirls",
        "tailwindcss",
        "tflint",
        "pylsp",
        "dockerls",
        "bashls",
        "marksman",
        "solargraph",
        "cucumber_language_server",
        "gopls",
        "astro",
      },
      handlers = {
        lsp.default_setup,
        lua_ls = function()
          local lua_opts = lsp.nvim_lua_ls()
          require("lspconfig").lua_ls.setup(lua_opts)
        end,
      },
    }

    -- Set up blink.nvim for insert mode completion
    require("blink").setup {
      snippet_engine = "luasnip",
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer",  keyword_length = 3 },
        { name = "path" },
        { name = "emoji" },
      },
      mapping = {
        ["<C-p>"] = "prev_item",
        ["<C-n>"] = "next_item",
        ["<C-y>"] = "confirm",
        ["<CR>"] = "confirm",
        ["<C-Space>"] = "complete",
        ["<C-Tab>"] = "supertab",
        ["<M-Tab>"] = "shift_supertab",
      },
    }

    -- Minimal nvim-cmp setup JUST for command-line completion
    local cmp = require "cmp"
    cmp.setup { enabled = false } -- Disable everywhere by default
    -- `/` cmdline setup
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` cmdline setup
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    -- Snippet setup
    require("luasnip.loaders.from_vscode").lazy_load()
    require("lspconfig").ruff.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.completionProvider = nil
      end,
    }
  end,
}
