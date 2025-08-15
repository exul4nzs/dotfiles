-- LazyGit integration with Telescope
return {
		"kdheepak/lazygit.nvim",
		keys = {
			{
				"<leader>lg",
				"<cmd>LazyGit<cr>",
        desc = "Open LazyGit",
				silent = true,
				noremap = true,
			},
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	}
