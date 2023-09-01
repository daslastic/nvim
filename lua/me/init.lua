require("me.globals")
require("me.options")
require("me.remap")
require("me.lazy")
require("me.gruvbox")
require("me.lsp")

local function defer_init()
  require("me.defer.cmp")
  require("me.defer.comment")
  require("me.defer.tmux")
  require("me.defer.autocommands")
  require("me.defer.context")
  require("me.defer.autopairs")
  require("me.defer.fidget")
  require("me.defer.null-ls")
  require("me.defer.colorizer")
  require("me.defer.inlayhints")
  require("me.defer.todo")
end

-- makes nvim launch much quicker
vim.defer_fn(defer_init, 30)
