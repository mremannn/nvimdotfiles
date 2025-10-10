--return {
--	"EdenEast/nightfox.nvim",
--	lazy = false,
--	priority = 1000,
--	opts = {},
--	config = function()
--		vim.cmd.colorscheme("carbonfox")
--	end,
--}

return {
	"rose-pine/neovim",
	lazy = false,
	config = function()
		vim.cmd.colorscheme("rose-pine")
	end,
}

--return { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }

--return {
--	"folke/tokyonight.nvim",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		require("tokyonight").setup({})
--		vim.cmd.colorscheme("tokyonight-night")
--	end,
--}
