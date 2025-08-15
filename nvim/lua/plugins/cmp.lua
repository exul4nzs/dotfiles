return {
  "hrsh7th/nvim-cmp",
  optional = true,
  opts = function(_, opts)
    opts.sorting = opts.sorting or {}
    opts.sorting.comparators = opts.sorting.comparators or {}
    table.insert(opts.sources, { name = "git" })
    table.insert(opts.sorting.comparators, 1, require "clangd_extensions.cmp_scores")

    -- Add snippet capability
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }

    -- Merge with default mappings (non-destructively)
    opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
      ["<C-f>"] = require("cmp").mapping(function(fallback)
        if require("luasnip").jumpable(1) then
          require("luasnip").jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-b>"] = require("cmp").mapping(function(fallback)
        if require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    -- original LazyVim kind icon formatter
    local format_kinds = opts.formatting.format
    opts.formatting.format = function(entry, item)
      format_kinds(entry, item) -- add icons
      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end
    return opts
  end,
}
