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
					-- Default handler for all servers
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
							on_attach = function(_, bufnr)
								local opts = { buffer = bufnr, silent = true }
								vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
								vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
								vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
								vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
								vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
								vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
							end,
						})
					end,

					-- Example of custom config for Lua
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
								},
							},
						})
					end,
				},
			})

			-- 🔹 Global diagnostic config
			vim.diagnostic.config({
				virtual_text = { spacing = 2, prefix = "●" },
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- 🔹 Gutter icons
			local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- 🔹 Show diagnostics in floating window on hover
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
				end,
			})
		end,
	},

	-- Completion engine
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
