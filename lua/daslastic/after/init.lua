local M = {}

function M.after_init()
  require("daslastic.after.comment")
  require("daslastic.after.cmp")
  require("daslastic.after.telescope")
  require("daslastic.after.autocommands")
  require("daslastic.after.gitsigns")
  require("daslastic.after.illuminate")
  require("daslastic.after.autopairs")
  require("daslastic.after.fidget")
  require("daslastic.after.null-ls")
  require("daslastic.after.todo")
  require("daslastic.after.zenmode")
  require("daslastic.after.dap")
  require("daslastic.after.colorizer")
  require("daslastic.after.inlayhints")
end

vim.defer_fn(M.after_init, 50)
