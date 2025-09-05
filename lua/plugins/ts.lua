return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- make sure parsers stay up to date
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"javascript",
					"typescript",
					"rust",
					"go",
					"html",
					"css",
					"json",
					"bash",
					"markdown",
				},
				sync_install = false, -- don’t block startup
				auto_install = true, -- auto-install missing parsers when you open a file
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<CR>",
						scope_incremental = "<S-CR>",
						node_decremental = "<BS>",
					},
				},
			})
		end,
	},
}
