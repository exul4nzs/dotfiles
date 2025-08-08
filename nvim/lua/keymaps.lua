require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Oil
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Jump between markdown headers
map("n", "gj", [[/^##\+ .*<CR>]], opts)
map("n", "gk", [[?^##\+ .*<CR>]], opts)

--Save File
map("n", "<leader>w", ":w<CR>",  { desc = "Save File" })
map("n", "<leader>ww", ":w!<CR>",  { desc = "Save File Override" })
map("n", "<leader>wwq", ":wq!<CR>",  { desc = "Save and Quit File Override" })
map("n", "<leader>wq", ":wq<CR>",  { desc = "Save and Quit" })
map("n", "<leader>W", ":wa<CR>", { desc = "Save All Files" })
map("n", "<leader>Wq", ":wqa<CR>", { desc = "Save and Quit All Files" })
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit All"} )

-- Tabs
map("n",  "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab"})
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Only Tabs" })
map("n", "<leader>tm", "<cmd>tabmove<cr>", { desc = "Move Tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<lader>th", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Split and Move Window
map("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make Windows Equal Width" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" })
map("n", "<leader>so", "<C-w>o", { desc = "Close Other Splits" })

-- Move Window
map("n", "<leader>wH", "<C-w>H", { desc = "Move to Left Split" })
map("n", "<leader>wJ", "<C-w>J", { desc = "Move to Bottom Split" })
map("n", "<leader>wK", "<C-w>K", { desc = "Move to Top Split" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move to Right Split" })

-- Resize Window
map("n", "<M-S-h>", "<C-w><", { desc = "Resize Window Left" })
map("n", "<M-S-l>", "<C-w>>", { desc = "Resize Window Right" })
map("n", "<M-S-j>", "<C-w>+", { desc = "Resize Window Down" })
map("n", "<M-S-k>", "<C-w>-", { desc = "Resize Window Up" })

-- Messages
map("n", "<leader>m", "<cmd>messages<CR>", { desc = "Messages" })
map("n", "<leader>mc", "<cmd>confirm<CR>", { desc = "Confirm" })

-- Nvim Tree Find File
map("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>", opts)

-- Exit insert mode without hitting Esc
map("i", "jj", "<Esc><Esc>", { desc = "Esc" })

-- CapsLock as alternative Esc
map('i', '<CapsLock>', '<ESC>', opts)

-- Make Y behave like C or D
map("n", "Y", "y$")

-- Select all
map("n", "==", "gg<S-v>G", { desc = "Highlight All" })

-- Horizontal terminal (closable)
map("n", "<leader>Th", function()
  vim.cmd("split term://$SHELL")
  vim.cmd("startinsert")  -- Auto-enter insert mode
end, { desc = "Horizontal Terminal" })

-- Vertical terminal (closable)
map("n", "<leader>Tv", function()
  vim.cmd("vsplit term://$SHELL")
  vim.cmd("startinsert")
end, { desc = "Vertical Terminal" })

-- BOTH splits at once (horizontal + vertical)
map("n", "<leader>tt", function()
  vim.cmd("split term://$SHELL")   -- Horizontal split
  vim.cmd("vsplit term://$SHELL")  -- Vertical split
end, { desc = "Split Terminal (Horizontal & Vertical)" })

-- Close ALL terminal buffers
map("n", "<leader>tc", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      vim.api.nvim_buf_delete(buf, { force = true })  -- Force-close
    end
  end
end, { desc = "Close ALL Terminals" })

-- Keep window centered when going up/down
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without overwriting register
map("v", "p", '"_dP')

-- Copy text to " register
map("n", "<leader>y", "\"+y", { desc = "Yank into \" register" })
map("v", "<leader>y", "\"+y", { desc = "Yank into \" register" })
map("n", "<leader>Y", "\"+Y", { desc = "Yank into \" register" })

-- Delete text to " register
map("n", "<leader>d", "\"_d", { desc = "Delete without \" register" })
map("v", "<leader>d", "\"_d", { desc = "Delete without \" register" })

-- Get out Q
-- map("n", "Q", "<nop>")

-- close buffer
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Close buffer without closing split
map("n", "<leader>wx", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
map("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
map("n", "<leader>;", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- Make current file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- Jump to plugin management file
map("n", "<leader>epp", "<cmd>e ~/.config/nvim/lua/plugins/plugins.lua<CR>", { desc = "Jump to configuration file" })

-- Run Tests
map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
map("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { desc = "Run Test File" })
map("n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  { desc = "Run Current Test Directory" })
map("n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>",
  { desc = "Toggle Test Output Panel" })
map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })

-- Debug Tests
map("n", "<leader>dt", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
map("n", "<leader>dso", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
map("n", "<leader>dsi", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
map("n", "<leader>dsu", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
map("n", "<leader>dst", "<cmd>DapStepTerminate<CR>", { desc = "Stop Debugger" })
map("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Toggle Breakpoint Condition" })
map("n", "<leader>E", "<cmd>lua require'dap'.set_exception_breakpoints()<CR>",
  { desc = "Toggle Exception Breakpoint" })
map("n", "<leader>dr",
  "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>",
  { desc = "Show DAP REPL" })
map("n", "<leader>ds",
  "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Scopes" })
map("n", "<leader>df",
  "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Stacks" })
map("n", "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>",
  { desc = "Show DAP breakpoints" })
map("n", "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debug Last Test" })

-- Copy file paths
map("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
map("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

map("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

-- Normal Mode
map('n', '<C-BS>', 'vb"_d', { desc = "Delete previous word" })
map('n', '<A-BS>', 'vb"_d', { desc = "Delete previous word (Alt)" })

-- Insert Mode
map('i', '<C-BS>', '<C-w>', { desc = "Delete previous word" })
map('i', '<A-BS>', '<C-w>', { desc = "Delete previous word (Alt)" })

-- Dismiss Noice Message
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Open Zoxide telescope extension
map("n", "<leader>Z", "<cmd>Zi<CR>", { desc = "Open Zoxide" })

-- Resize with arrows
map("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
map("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Obsidian
map("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
  { desc = "Obsidian Check Checkbox" })
map("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

map({ "n", "o", "x" }, "<s-h>", "^", { desc = "Jump to beginning of line" })
map({ "n", "o", "x" }, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Move block
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
map("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- exit terminal mode shortcut
map("t", "<Esc>", "<C-\\><C-n>")
-- map("t", "<C-t>", "<C-\\><C-n>")

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Auto enter insert mode when opening a terminal",
  group = "custom_buffer",
  pattern = "*",
  callback = function()
    -- Wait briefly just in case we immediately switch out of the buffer (e.g. Neotest)
    vim.defer_fn(function()
      if vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
        vim.cmd([[startinsert]])
      end
    end, 100)
  end,
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = "custom_buffer",
  pattern  = "*",
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>") -- Save File in normal, insert and visual mode
map({ "n", "i", "v" }, "<M-S-q>", "<cmd> q! <cr>") -- Quit File Override
