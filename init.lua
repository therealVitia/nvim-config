--Appel des fichiers de configuration
--Config/lazy appelle lui même lua/plugins
require("config.lazy")
require("config.remap")
require("config.options")
--require("config.autocmd")
require("config.lsp")
require("config.func-len").setup({
	max_lines = 25,
	enabled_filetypes = {"c", "cpp"},
})

-- Choose a colorscheme !
-- vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme tokyonight-night")
