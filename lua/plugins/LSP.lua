return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = require("blink.cmp").get_lsp_capabilities(),
						})
					end,
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},

			appearance = {
				nerd_font_variant = "normal",
			},

			completion = { documentation = { auto_show = true } },

			sources = {
				default = { "lsp", "path" }, --"snippets","buffer"
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
}
