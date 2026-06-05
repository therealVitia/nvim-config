return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets"
	},
	opts = function (_, opts)
		-- Set up nvim-cmp.
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		if opts then luasnip.config.setup(opts) end
		vim.tbl_map(function (type)
				require("luasnip.loaders.from_" .. type).lazy_load()
			end, { "vscode", "snipmate", "lua" })
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		return {
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function (args)
					luasnip.lsp_expand(args.body) -- For Luasnip
				end
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered()
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }
			},
				{
					{ name = "buffer" }
				}),
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-n>"] = cmp.mapping(function (fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping(function (fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" })
			})
		}
	end
}
