return {
    'MeanderingProgrammer/render-markdown.nvim',
	ft = "markdown",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.opt_local.conceallevel = 2
			end,
		})
		require("render-markdown").setup({
			html = { enabled = false },
			latex = { enabled = false },
			yaml = { enabled = false }
		})
	end,
}
