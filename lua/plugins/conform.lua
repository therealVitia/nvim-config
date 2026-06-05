return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function ()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Normer le fichier"
		}
	},
	opts = {
		-- Définition du formateur par type de fichier
		formatters_by_ft = {
			-- cpp = { "clang-format" }
		},
		-- Autocommande pour formater à la sauvegarde
		format_on_save = {
			timeout_ms = 500
			-- lsp_fallback = true
		},
		-- Configuration spécifique des formateurs
		formatters = {
			["clang-format"] = {
				prepend_args = {
					"--style={BasedOnStyle: LLVM, IndentWidth: 4, IndentAccessModifiers: true, AlignConsecutiveDeclarations: AcrossComments, IncludeBlocks: Regroup, BreakBeforeBraces: Linux, AlignArrayOfStructures: Left}"
				}
			}
		}
	}
}
