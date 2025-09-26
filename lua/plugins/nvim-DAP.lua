return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		vim.keymap.set("n", "<F7>", function()
			require("dapui").toggle()
		end)
	end,
}
