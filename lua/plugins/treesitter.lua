return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		auto_install = true
	},
	config = function (_, _opts)
		-- require("nvim-treesitter.configs").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"cpp",
				"lua",
				"python",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"zig",
				"gdscript",
				"gdshader",
				"godot_resource"
			},
			callback = function ()
				vim.treesitter.start()
			end
		})
	end
}
