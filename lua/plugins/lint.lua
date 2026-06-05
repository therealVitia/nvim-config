return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		local lint = require("lint")
		
		lint.linters_by_ft = { cpp = { "cpplint" } }
		
		local cpplint = lint.linters.cpplint
		cpplint.args = {
			"--filter=-whitespace/tab,-legal/copyright,-whitespace/indent,-build/include_subdir,-whitespace/braces,[build/include_order]",
			"%filepath"
		}
		
		-- Déclenche le linter lors de la sauvegarde ou en quittant le mode insertion
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function ()
				lint.try_lint()
			end
		})
	end
}
