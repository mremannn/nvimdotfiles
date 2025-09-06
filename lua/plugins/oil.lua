return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<C-n>", vim.cmd.Oil)
	end,
	lazy = false,
}
