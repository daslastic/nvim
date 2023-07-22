vim.cmd("setlocal tabstop=4 shiftwidth=4")

local s = safe_require("crates")
if not s then
  return
end
s.setup()
