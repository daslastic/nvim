function Colourscheme(colour)
	colour = colour or "gruvbox"
	vim.cmd.colorscheme(colour)
end

function Lualine()
	local custom_gruvbox = require("lualine.themes.gruvbox")
	-- custom_gruvbox.normal.c.bg = "#000000"
	-- custom_gruvbox.normal.c.fg = "#f0f0f0"
	-- custom_gruvbox.insert.c.bg = "#000000"
	-- custom_gruvbox.insert.c.fg = "#f0f0f0"
	-- custom_gruvbox.visual.c.bg = "#000000"
	-- custom_gruvbox.visual.c.fg = "#f0f0f0"
	return custom_gruvbox
end

Colourscheme()
