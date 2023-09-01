local line = safe_require "lualine"
if not line then
  return
end

line.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { '' },
    lualine_b = { '' },
    lualine_c = { 'filename' },
    lualine_x = { '' },
    lualine_y = { '' },
    lualine_z = { 'branch' }
  },
})
