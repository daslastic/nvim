local colorscheme = "darkplus"

vim.g.transparent_background = true
vim.g.italic_comments = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
