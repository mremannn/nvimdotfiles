return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- format before save
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				json = { "jq" },
				markdown = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
		})

		-- Keymap: <leader>fm for formatting
		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format file or range with conform" })
	end,
}
