--return { "nvim-mini/mini.statusline", version = false, opts = {} }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "catppuccin",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
