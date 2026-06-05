-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function ()
		vim.highlight.on_yank()
	end
})

vim.api.nvim_create_autocmd('VimEnter', {
	nested = true,
	desc = 'Load last session when opening buffer',
	group = vim.api.nvim_create_augroup('restore_session', { clear = true }),
	callback = function ()
		if vim.fn.argc() == 0 then
			require("persistence").load()
		end
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gdscript",
	callback = function ()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = false
	end
})
