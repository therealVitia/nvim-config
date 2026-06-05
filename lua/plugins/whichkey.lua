return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 150,
		triggers = {
			{ "<leader>", mode = { "n", "v" } }
		},
		win = {
			no_overlap = true,
			title = false,
			height = {
				max = 15,
			},
		}
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
