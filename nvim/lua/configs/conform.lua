local options = {
  formatters_by_ft = {
    lua = { "stylua" },
<<<<<<< HEAD
    svelte = { { "prettierd", "prettier", stop_after_first = true } },
    astro = { { "prettierd", "prettier", stop_after_first = true } },
    cs = { "csharpier" },
    -- javascript = { { "prettierd", "prettier", stop_after_first = true } },
    -- typescript = { { "prettierd", "prettier", stop_after_first = true } },
    -- javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
    -- typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
    -- json = { { "prettierd", "prettier", stop_after_first = true } },
    javascript = { "biome" },
    typescript = { "biome" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    graphql = { { "prettierd", "prettier", stop_after_first = true } },
    java = { "google-java-format" },
    kotlin = { "ktlint" },
    ruby = { "standardrb" },
    markdown = { { "prettierd", "prettier", stop_after_first = true } },
    erb = { "htmlbeautifier" },
    html = { "htmlbeautifier" },
    bash = { "beautysh" },
    zsh = { "beautysh" },
    proto = { "buf" },
    rust = { "rustfmt" },
    yaml = { "yamlfix" },
    toml = { "taplo" },
    css = { { "prettierd", "prettier", stop_after_first = true } },
    scss = { { "prettierd", "prettier", stop_after_first = true } },
    sh = { "shellcheck" },
    go = { "gofmt" },
    sh = { "shfmt" },
    xml = { "xmllint" },
  },
  formatters = {
    csharpier = {
      command = "dotnet-csharpier",
      args = {  "--write-stdout" },
    }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
=======
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
>>>>>>> 27faf42fcc5bc51571f09cc7aea64aa55b18a3e1
}

return options
