local M = {}

M.config = { max_lines = 25, enabled_filetypes = { "lua", "c", "cpp" } }

local function get_function_query(lang)
	local queries = { lua = "(function_definition) @function", c = "(function_definition) @function" }
	return queries[lang]
end

-- Vérifie la longueur des fonctions
function M.check_function_lengths()
	local bufnr = vim.api.nvim_get_current_buf()
	local filetype = vim.bo[bufnr].filetype
	-- Vérifie si le filetype est supporté
	if not vim.tbl_contains(M.config.enabled_filetypes, filetype) then
		return
	end
	-- Vérifie si Treesitter est disponible pour ce filetype
	local ok, parser = pcall(vim.treesitter.get_parser, bufnr, filetype)
	if not ok then
		return
	end
	local query_string = get_function_query(filetype)
	if not query_string then
		return
	end
	local query = vim.treesitter.query.parse(filetype, query_string)
	local tree = parser:parse()[1]
	local root = tree:root()
	-- Efface les diagnostics précédents
	vim.diagnostic.reset(vim.api.nvim_create_namespace("function-length"), bufnr)
	local diagnostics = {}
	for _, node in query:iter_captures(root, bufnr, 0, -1) do
		local start_row, start_col, end_row, _ = node:range()
		local length = (end_row - start_row + 1) - 3
		if length > M.config.max_lines then
			local line = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]
			local line_length = #line
			
			table.insert(diagnostics, {
				lnum = start_row,
				col = start_col,
				end_lnum = start_row,
				end_col = line_length,
				severity = vim.diagnostic.severity.ERROR,
				message = string.format("Function is too long (%d/%d)", length, M.config.max_lines),
				source = "function-length"
			})
		end
	end
	-- Affiche les diagnostics
	vim.diagnostic.set(vim.api.nvim_create_namespace("function-length"), bufnr, diagnostics, {})
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
	-- Autocommands pour vérifier automatiquement
	local group = vim.api.nvim_create_augroup("FunctionLengthCheck", { clear = true })
	vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "TextChanged", "InsertLeave" }, {
		group = group,
		pattern = "*",
		callback = function ()
			M.check_function_lengths()
		end
	})
	-- Commande manuelle
	vim.api.nvim_create_user_command("CheckFunctionLength", function ()
		M.check_function_lengths()
	end, {}
	)
end

return M
