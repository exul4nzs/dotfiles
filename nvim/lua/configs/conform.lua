local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    svelte = { "prettier" },
    astro = { "prettier" },
    cs = { "csharpier" },
    javascript = { "biome" },
    typescript = { "biome" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    graphql = { "prettier" },
    java = { "google-java-format" },
    kotlin = { "ktlint" },
    ruby = { "standardrb" },
    markdown = { "prettier" },
    erb = { "htmlbeautifier" },
    html = { "htmlbeautifier" },
    bash = { "beautysh" },
    proto = { "buf" },
    rust = { "rustfmt" },
    yaml = { "yamlfix" },
    toml = { "taplo" },
    css = { "prettier" },
    scss = { "prettier" },
    sh = { "shellcheck" },
    go = { "gofmt" },
    xml = { "xmllint" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
