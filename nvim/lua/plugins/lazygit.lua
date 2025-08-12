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
<<<<<<< HEAD
	}
=======
}
>>>>>>> 27faf42fcc5bc51571f09cc7aea64aa55b18a3e1
