return {
	"nvim-mini/mini.pick",
	version = false,
	config = function()
		require("mini.pick").setup()
		vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>")
	end,
}
