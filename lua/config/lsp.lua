-- Enabling lsps
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = { "emmylua_ls", "clangd", "tinymist", "wc-language-server", "ruff", "copilot-language-server", "zls" }

for _, server in ipairs(servers) do
	vim.lsp.config(server, { capabilities = capabilities })
	vim.lsp.enable(server)
end

-- Weird specific thing for godot
local projectfile = vim.fn.getcwd() .. '/project.godot'
if projectfile then
	vim.lsp.config("gdscript", {
		cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
		root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1])
	})
	vim.lsp.enable("gdscript")
end

-- Prettier error displaying
vim.diagnostic.config({
	-- set either one depending on your preference
	virtual_text = true,
	virtual_lines = false,
	signs = false,
	severity_sort = false,
	underline = false
})

_G.floating_options = { focusable = true, focus = false, max_height = 50, max_width = 100 }
