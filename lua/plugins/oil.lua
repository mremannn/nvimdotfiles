return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<C-n>", vim.cmd.Oil)
	end,
	lazy = false,
}
