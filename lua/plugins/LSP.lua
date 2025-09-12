return {
	-- LSP installer
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	-- Mason bridge to lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "gopls" }, -- auto-install
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = require("blink.cmp").get_lsp_capabilites(),
							on_attach = function(_, bufnr)
								local opts = { buffer = bufnr, silent = true }
								vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
								vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
								vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
							end,
						})
					end,
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- See :h blink-cmp-config-keymap for defining your own keymap
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
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
