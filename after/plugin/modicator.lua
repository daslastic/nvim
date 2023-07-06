require("modicator").setup({
	show_warnings = true,
	highlights = {
		-- Default options for bold/italic
		defaults = {
			bold = true,
			italic = false,
		},
	},
})

vim.api.nvim_set_hl(0, "NormalMode", { fg = "#fabd2f", bg = "None" })
vim.api.nvim_set_hl(0, "InsertMode", { fg = "#83a598", bg = "None" })
vim.api.nvim_set_hl(0, "VisualMode", { fg = "#fe8019", bg = "None" })
