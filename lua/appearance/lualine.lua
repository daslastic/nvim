return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "" },
				lualine_x = { "" },
				lualine_y = { "" },
				lualine_z = { "branch" },
			},
		},
	},
}
