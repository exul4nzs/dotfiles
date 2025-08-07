local M = {}

local api = vim.api
local fn = vim.fn

-- slanted unicode separators
local sep_l = ""
local sep_r = ""

-- highlight groups (you can tweak colors)
api.nvim_set_hl(0, "TabSlantL", { fg = "#89b4fa", bg = "#1e1e2e" })
api.nvim_set_hl(0, "TabSlantR", { fg = "#89b4fa", bg = "#1e1e2e" })
api.nvim_set_hl(0, "TabText", { fg = "#cdd6f4", bg = "#1e1e2e", bold = true })

-- returns current buffer name
local function get_buf_name(bufnr)
  local name = fn.fnamemodify(fn.bufname(bufnr), ":t")
  return name == "" and "[No Name]" or name
end

M.get_bufs = function()
  local bufs = {}
  for _, bufnr in ipairs(api.nvim_list_bufs()) do
    if api.nvim_buf_is_loaded(bufnr) and api.nvim_buf_get_option(bufnr, "buflisted") then
      table.insert(bufs, bufnr)
    end
  end
  return bufs
end

M.build = function()
  local bufs = M.get_bufs()
  local components = {}

  for _, bufnr in ipairs(bufs) do
    local is_current = (bufnr == api.nvim_get_current_buf())
    local icon = " " -- Nerd Font file icon (or customize per filetype)

    local name = get_buf_name(bufnr)
    local hl = "%#TabText#"

    local sl_l = "%#TabSlantL#" .. sep_l
    local sl_r = "%#TabSlantR#" .. sep_r

    local tab = sl_l .. hl .. " " .. icon .. name .. " " .. sl_r
    table.insert(components, tab)
  end

  -- Add "+" button for new tab (optional aesthetic)
  table.insert(components, "%#TabText#  ")

  return table.concat(components)
end

M.tabufline = function()
  vim.o.showtabline = 2
  vim.api.nvim_set_option("tabline", "%!v:lua.require'custom.ui.tabufline'.build()")
end

M.tabufline()
return M
