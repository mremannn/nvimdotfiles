-- 🔹 Global diagnostic config
vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- 🔹 Show diagnostics in floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
	end,
})
