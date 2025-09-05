return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		telescope.setup({})

		-- safe to map here, plugin is loaded
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
	end,
}
