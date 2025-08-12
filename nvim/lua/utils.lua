local M = {}

M.get_showcmd = function()
  -- Works for pending operators, counts, motions
  return vim.fn.getcmdtype() == "" and vim.fn.getcmdline() or ""
end

return M
