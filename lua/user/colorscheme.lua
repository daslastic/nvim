-- vim.g.gruvbox_contrast_dark = 'hard'
vim.opt.background = "dark"
local colorscheme = "gruvbox"

-- vim.g.transparent_background = true
vim.g.italic_comments = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
