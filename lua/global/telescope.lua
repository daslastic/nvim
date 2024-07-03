local M = {}

M.telescope = require "telescope"
M.builtin = require "telescope.builtin"
M.themes = require "telescope.themes"
M.opts = {
  previewer = true,
  hidden = true,
  no_ignore = false,
}

M.vsplit = function()
  vim.cmd("vsplit")
  vim.cmd("Ex")
  M.builtin.find_files(M.themes.get_dropdown(M.opts))
end

M.split = function()
  vim.cmd("split")
  vim.cmd("Ex")
  M.builtin.find_files(M.themes.get_dropdown(M.opts))
end

M.find = function()
  M.builtin.find_files(M.themes.get_dropdown(M.opts))
end

M.grep = function()
  M.builtin.live_grep(M.themes.get_dropdown(M.opts))
end

return M
