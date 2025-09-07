return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"williamboman/mason.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "cppdbg", "python", "delve" },
			handlers = {}, -- sets up dap in the predefined manner
		})
		require("dapui").setup()
		vim.keymap.set("n", "<F7>", function()
			require("dapui").toggle()
		end)
	end,
}
