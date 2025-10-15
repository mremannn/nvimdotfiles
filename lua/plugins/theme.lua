--return {
--	"EdenEast/nightfox.nvim",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		require("nightfox").setup({
--			options = {
--				transparent = true,
--			},
--		})
--		vim.cmd.colorscheme("carbonfox")
--	end,
--}

--return {
--	"rose-pine/neovim",
--	lazy = false,
--	config = function()
--		vim.cmd.colorscheme("rose-pine")
--	end,
--}

--return { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}

--return {
--	"rebelot/kanagawa.nvim",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		require("kanagawa").setup({
--			transparent = true,
--		})
--		vim.cmd.colorscheme("kanagawa-wave")
--	end,
--}

--return {
--	"Yazeed1s/oh-lucy.nvim",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		vim.g.oh_lucy_transparent_background = true
--		vim.cmd.colorscheme("oh-lucy")
--	end,
--}

--return {
--	"catppuccin/nvim",
--	lazy = false,
--	priority = 1000,
--	name = "catppuccin",
--	config = function()
--		require("catppuccin").setup({
--			flavour = "macchiato",
--			transparent_background = true,
--		})
--		vim.cmd.colorscheme("catppuccin")
--	end,
--}
