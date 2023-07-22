local s = safe_require("zen-mode")
if not s then
  return
end
s.setup({
  window = {
    backdrop = 1,
    height = 0.9,
    width = 120,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = true,
      cursorcolumn = false, -- disable cursor column
    },
  },
  plugins = {},
})
