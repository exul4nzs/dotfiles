require "nvchad.mappings"

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Oil
keymap("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Jump between markdown headers
keymap("n", "gj", [[/^##\+ .*<CR>]], opts)
keymap("n", "gk", [[?^##\+ .*<CR>]], opts)

-- Stop compiler task
keymap("n", "<leader>Cs", "<cmd>CompilerStop<CR>", { desc = "Dispose all tasks" })

keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Telescope recent projects" })

-- Delete old tasks (debugging)
keymap("n", "<leader>Cr", "<cmd>CompilerRedo<CR>", { desc = "Redo the last selected option" })

-- Delete old tasks (debugging)
keymap("n", "<leader>Ct", "<cmd>CompilerToggleResults<CR>", { desc = "Open or close the compiler results" })

-- Open Mason
keymap("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Open Mason" })
-- Open Lazy
keymap("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

--Save File
keymap("n", "<leader>w", ":w<CR>", { desc = "Save File" })
keymap("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" })
keymap("n", "<leader>W", ":wa<CR>", { desc = "Save All Files" })
keymap("n", "<leader>Wq", ":wqa<CR>", { desc = "Save and Quit All Files" })
keymap("n", "<leader>Q", ":qa<CR>", { desc = "Quit All" })
keymap("n", "<leader>Qq", ":q!<CR>", { desc = "Quit Without Saving" })

-- Insert 2 spaces in Normal mode
keymap("n", "<M-a>", "2i<Space><Esc>", { noremap = true, desc = "Insert 2 spaces" })

-- Insert 2 spaces in Visual mode (will replace selected text with spaces)
keymap("v", "<M-a>", "c<Esc>2i<Space><Esc>", { noremap = true, desc = "Replace selection with 2 spaces" })

-- Nvdash-Snacks
vim.api.nvim_create_user_command("Nvdash", function()
  require("snacks.dashboard").open()
end, {})
keymap("n", "<leader>Nv", ":Nvdash<CR>", { desc = "Open Neovim dashboard" })

-- Molten keymap
keymap("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
keymap("n", "<localleader>me", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
keymap("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
keymap("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
keymap("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "evaluate visual selection" })
keymap("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
keymap("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
keymap("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })

-- Showkeys
keymap("n", "<leader>Tk", "<cmd>ShowkeysToggle<cr>", { desc = "Toggle Show Keys" })

-- Switch to alternate buffer
keymap("n", "<leader>bb", ":b#<CR>", { desc = "Switch to Alternate Buffer" })

-- Map <leader>bb to switch to alternate file
keymap("n", "<leader>bf", "<cmd>e#<CR>", { desc = "Switch to alternate file" })

-- Tabs
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Only Tabs" })
keymap("n", "<leader>tm", "<cmd>tabmove<cr>", { desc = "Move Tab" })
keymap("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<lader>th", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Split Window
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make Windows Equal Width" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" })
keymap("n", "<leader>so", "<C-w>o", { desc = "Close Other Splits" })

-- Move Window
keymap("n", "<leader>wH", "<C-w>H", { desc = "Move to Left Split" })
keymap("n", "<leader>wJ", "<C-w>J", { desc = "Move to Bottom Split" })
keymap("n", "<leader>wK", "<C-w>K", { desc = "Move to Top Split" })
keymap("n", "<leader>wL", "<C-w>L", { desc = "Move to Right Split" })

-- Resize Window
keymap("n", "<M-S-h>", "<C-w><", { desc = "Resize Window Left" })
keymap("n", "<M-S-l>", "<C-w>>", { desc = "Resize Window Right" })
keymap("n", "<M-S-j>", "<C-w>+", { desc = "Resize Window Down" })
keymap("n", "<M-S-k>", "<C-w>-", { desc = "Resize Window Up" })

-- Messages
keymap("n", "<leader>m", "<cmd>messages<CR>", { desc = "Messages" })
keymap("n", "<leader>mc", "<cmd>confirm<CR>", { desc = "Confirm" })

-- Nvim Tree Find File
keymap("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>", opts)

-- For Zen Browser
keymap("n", "<leader>lz", ":!zen-browser %<CR>", { desc = "Open HTML in Zen Browser" })

-- Exit insert mode without hitting Esc
keymap("i", "jj", "<Esc><Esc>", { desc = "Esc" })

-- CapsLock as alternative Esc
keymap("i", "<CapsLock>", "<ESC>", opts)

-- Make Y behave like C or D
keymap("n", "Y", "y$")

-- Select all
keymap("n", "==", "gg<S-v>G", { desc = "Highlight All" })

-- local function create_terminal(direction)
--   local term = require("toggleterm.terminal")
--   local new_term = term.Terminal:new({
--     direction = direction, -- 'horizontal' or 'vertical'
--     on_open = function(t)
--       vim.cmd.startinsert() -- Auto-enter insert mode
--       -- Register with edgy (if available)
--       if package.loaded.edgy then
--         require("edgy").set_scope(t.bufnr, direction == "horizontal" and "bottom" or "right")
--       end
--     end,
--   })
--   new_term:toggle()
-- end
-- -- Horizontal terminal (edgy-managed)
-- keymap("n", "<leader>Th", function()
--   create_terminal("horizontal")
-- end, { desc = "Horizontal Terminal" })
--
-- -- Vertical terminal (edgy-managed)
-- keymap("n", "<leader>Tv", function()
--   create_terminal("vertical")
-- end, { desc = "Vertical Terminal" })

-- Horizontal terminal
keymap("n", "<leader>Th", function()
  vim.cmd "split term://$SHELL"
  vim.cmd "startinsert"
  vim.api.nvim_buf_set_name(0, "NvChad Terminal (Horizontal)")
  vim.wo.winbar = "   NvChad Terminal "
end, { desc = "Horizontal Terminal" })

-- Vertical terminal
keymap("n", "<leader>Tv", function()
  vim.cmd "vsplit term://$SHELL"
  vim.cmd "startinsert"
  vim.api.nvim_buf_set_name(0, "NvChad Terminal (Vertical)")
  vim.wo.winbar = "   NvChad Terminal "
end, { desc = "Vertical Terminal" })

keymap("n", "<leader>tt", function()
  -- Horizontal terminal
  vim.cmd "split term://$SHELL"
  vim.cmd "startinsert"
  vim.api.nvim_buf_set_name(0, "NvChad Terminal (Horizontal)")
  vim.wo.winbar = "   NvChad Terminal "

  -- Vertical terminal (with slight delay)
  vim.defer_fn(function()
    vim.cmd "vsplit term://$SHELL"
    vim.cmd "startinsert"
    vim.api.nvim_buf_set_name(0, "NvChad Terminal (Vertical)")
    vim.wo.winbar = "   NvChad Terminal "
  end, 50)
end, { desc = "Dual Terminals" })

-- Close ALL terminal buffers
keymap("n", "<leader>tc", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      vim.api.nvim_buf_delete(buf, { force = true }) -- Force-close
    end
  end
end, { desc = "Close ALL Terminals" })

-- New empty buffer
keymap("n", "<leader>bN", ":enew<CR>", { desc = "New empty buffer", noremap = true, silent = true })

-- Next buffer (with count support)
keymap("n", "<Tab>", function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd("bnext " .. count)
end, { desc = "x + Next buffer", noremap = true, silent = true })

-- Previous buffer (with count support)
keymap("n", "<Tab><Tab>", function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd("bprevious " .. count)
end, { desc = "y + Previous buffer", noremap = true, silent = true })


-- Basic keybinding setup for LspUI
keymap("n", "K", "<cmd>LspUI hover<CR>")
keymap("n", "gr", "<cmd>LspUI reference<CR>")
keymap("n", "gd", "<cmd>LspUI definition<CR>")
keymap("n", "gt", "<cmd>LspUI type_definition<CR>")
keymap("n", "gi", "<cmd>LspUI implementation<CR>")
keymap("n", "<leader>rn", "<cmd>LspUI rename<CR>")
keymap("n", "<leader>ca", "<cmd>LspUI code_action<CR>")
keymap("n", "<leader>ci", "<cmd>LspUI call_hierarchy incoming_calls<CR>")
keymap("n", "<leader>co", "<cmd>LspUI call_hierarchy outgoing_calls<CR>")


-- Keep window centered when going up/down
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Paste without overwriting register
keymap("v", "p", '"_dP')

-- Copy text to " register
keymap("n", "<leader>y", '"+y', { desc = 'Yank into " register' })
keymap("v", "<leader>y", '"+y', { desc = 'Yank into " register' })
keymap("n", "<leader>Y", '"+Y', { desc = 'Yank into " register' })

-- Delete text to " register
keymap("n", "<leader>d", '"_d', { desc = 'Delete without " register' })
keymap("v", "<leader>d", '"_d', { desc = 'Delete without " register' })

-- Get out Q
keymap("n", "Q", "<nop>")
keymap("n", "Q", "@@", opts)
-- close buffer
keymap("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Close buffer without closing split
keymap("n", "<leader>wx", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
keymap("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
keymap("n", "<leader>;", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Make current file executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- Jump to plugin management file
keymap("n", "<leader>epp", "<cmd>e ~/.config/nvim/lua/plugins/plugins.lua<CR>", { desc = "Jump to configuration file" })

-- Run Tests
keymap("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
keymap(
  "n",
  "<leader>td",
  "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  { desc = "Run Current Test Directory" }
)
keymap(
  "n",
  "<leader>tp",
  "<cmd>lua require('neotest').output_panel.toggle()<CR>",
  { desc = "Toggle Test Output Panel" }
)
keymap("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })

-- Debug Tests
keymap("n", "<leader>dt", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
keymap("n", "<leader>dso", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
keymap("n", "<leader>dsi", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
keymap("n", "<leader>dk", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
keymap("n", "<leader>dst", "<cmd>DapStepTerminate<CR>", { desc = "Stop Debugger" })
keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
keymap(
  "n",
  "<leader>B",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Toggle Breakpoint Condition" }
)
keymap(
  "n",
  "<leader>E",
  "<cmd>lua require'dap'.set_exception_breakpoints()<CR>",
  { desc = "Toggle Exception Breakpoint" }
)
keymap("n", "<leader>dR", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Run Debugger Last" })
keymap("n", "<leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger Reset" })
keymap("n", "<leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger Testables" })
keymap(
  "n",
  "<leader>dr",
  "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>",
  { desc = "Show DAP REPL" }
)
keymap(
  "n",
  "<leader>ds",
  "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Scopes" }
)
keymap(
  "n",
  "<leader>df",
  "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Stacks" }
)
keymap(
  "n",
  "<leader>db",
  "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>",
  { desc = "Show DAP breakpoints" }
)
keymap("n", "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debug Last Test" })

-- Copy file paths
keymap("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
keymap("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

keymap("n", "<leader><leader>", function()
  vim.cmd "so"
end, { desc = "Source current file" })

-- Normal Mode
keymap("n", "<C-BS>", 'vb"_d', { desc = "Delete previous word" })
keymap("n", "<A-BS>", 'vb"_d', { desc = "Delete previous word (Alt)" })

-- Insert Mode
keymap("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
keymap("i", "<A-BS>", "<C-w>", { desc = "Delete previous word (Alt)" })

-- Dismiss Noice Message
keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Open Zoxide telescope extension
keymap("n", "<leader>Zi", "<cmd>Zi<CR>", { desc = "Open Zoxide" })
keymap("n", "<leader>Z", "<cmd>Z<CR>", { desc = "Go to Home Directory" })

-- Resize with arrows
keymap("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
keymap("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Obsidian
keymap(
  "n",
  "<leader>oc",
  "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
  { desc = "Obsidian Check Checkbox" }
)
keymap("n", "<leader>ot", "<cmd>Obsidian template<CR>", { desc = "Insert Obsidian Template" })
keymap("n", "<leader>oo", "<cmd>Obsidian open<CR>", { desc = "Open in Obsidian App" })
keymap("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", { desc = "Show ObsidianBacklinks" })
keymap("n", "<leader>ol", "<cmd>Obsidian links<CR>", { desc = "Show ObsidianLinks" })
keymap("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "Create New Note" })
keymap("n", "<leader>os", "<cmd>Obsidian search<CR>", { desc = "Search Obsidian" })
keymap("n", "<leader>oq", "<cmd>Obsidian quick_switch<CR>", { desc = "Quick Switch" })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap({ "n", "o", "x" }, "<s-h>", "^", { desc = "Jump to beginning of line" })
keymap({ "n", "o", "x" }, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Move block
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
keymap("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- Delete word FORWARD in insert mode (like Alt+Del in IDEs)
keymap("i", "<A-Del>", "<C-o>dw>", { noremap = true })

-- exit terminal mode shortcut
keymap("t", "<Esc><Esc>", "<C-\\><C-n>")
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
      if vim.api.nvim_buf_get_option(0, "buftype") == "terminal" then
        vim.cmd [[startinsert]]
      end
    end, 100)
  end,
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "custom_buffer",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- Open compiler
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
  "n",
  "<S-F6>",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true }
)

-- Toggle compiler results
vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

keymap({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")    -- Save File in normal, insert and visual mode
keymap({ "n", "i", "v" }, "<M-S-q>", "<cmd> q! <cr>") -- Quit File Override
