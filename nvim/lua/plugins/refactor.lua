return {
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		keys = {
			{
				"<leader>Rn",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				desc = "Incremental rename",
				mode = "n",
				noremap = true,
				expr = true,
			},
		},
		config = true,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>R",
				function()
					require("refactoring").select_refactor({
						show_success_message = true,
					})
				end,
        desc = "Refactor",
				mode = { "v", "n" },
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	}
}
