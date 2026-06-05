return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"YouSame2/inlinediff-nvim",
		lazy = true, -- disable loading plugin until called with cmd or keys
		cmd = "InlineDiff",
		opts = {}, -- leave blank to use defaults
		keys = {
			{
				"<leader>ghp",
				function()
					require("inlinediff").toggle()
				end,
				desc = "Toggle inline diff",
			},
		},
	}
}
