return {
  "luukvbaal/statuscol.nvim",
  event = "VeryLazy",
  config = function()
    local builtin = require("statuscol.builtin")

    -- 1️⃣ Disable default LSP signs completely (unchanged)
    vim.diagnostic.config({ signs = false })
    for _, group in ipairs({
      "DiagnosticSignError",
      "DiagnosticSignWarn",
      "DiagnosticSignInfo",
      "DiagnosticSignHint",
    }) do
      vim.fn.sign_define(group, { text = "", texthl = "", numhl = "" })
    end

    -- 2️⃣ Diagnostic icons + colors (unchanged)
    local diag_icons_map = {
      [vim.diagnostic.severity.ERROR] = { "", "DiagnosticError" },
      [vim.diagnostic.severity.WARN]  = { "", "DiagnosticWarn"  },
      [vim.diagnostic.severity.INFO]  = { "", "DiagnosticInfo"  },
      [vim.diagnostic.severity.HINT]  = { "", "DiagnosticHint"  },
    }

    local function diag_icons()
      local diags = vim.diagnostic.get(0, { lnum = vim.v.lnum - 1 })
      if #diags == 0 then return "  " end

      local max_severity = vim.diagnostic.severity.HINT
      for _, d in ipairs(diags) do
        if d.severity < max_severity then
          max_severity = d.severity
        end
      end

      local entry = diag_icons_map[max_severity]
      return entry and ("%#" .. entry[2] .. "#" .. entry[1] .. " ") or "  "
    end

    -- 3️⃣ DAP breakpoint icon (unchanged)
    local function dap_icons()
      local ok, dap = pcall(require, "dap")
      if not ok then return "  " end
      local breakpoints = require("dap.breakpoints").get()
      local bufnr = vim.api.nvim_get_current_buf()
      local bps = breakpoints[bufnr] or {}
      for _, bp in ipairs(bps) do
        if bp.line == vim.v.lnum then
          return "%#DiagnosticHint# " -- magenta-ish circle
        end
      end
      return "  "
    end


    -- 5️⃣ Setup statuscol with improved configuration
    require("statuscol").setup({
      relculright = false, -- numbers after icons
      foldfunc = "builtin", -- or use "custom_foldfunc" if you want to use the one above
      setopt = true,
      fold = {
        open = "",  -- icon for open fold
        close = "", -- icon for closed fold
        sep = " ",   -- separator between fold icon and text
      },
      segments = {
        { text = { dap_icons, diag_icons }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
          condition = { builtin.not_empty }, -- only show when there's something to show
        },
      }
    })

    -- 6️⃣ Optional: Custom highlight groups for better visual distinction
    vim.api.nvim_set_hl(0, "FoldIconOpen", { fg = "#7aa2f7" })  -- blue
    vim.api.nvim_set_hl(0, "FoldIconClosed", { fg = "#7aa2f7" }) -- blue
    vim.api.nvim_set_hl(0, "FoldText", { fg = "#565f89" })     -- dimmed text
  end
}
