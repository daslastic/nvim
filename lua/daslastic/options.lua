vim.loader.enable()

local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  guicursor = "",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 0,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  updatetime = 50,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  laststatus = 0, -- who needs statusbar, 3
  showcmd = false,
  ruler = false,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  -- colorcolumn = "100",
  guifont = "monospace:h17",
  title = true,
  titleold = vim.split(os.getenv("SHELL") or "", "/")[3],
  undofile = true,
  undodir = os.getenv("HOME") .. "/.cache/vimundo",
  hlsearch = false,
  incsearch = true,
}

vim.g.netrw_list_hide = '.DS_Store'

for k, v in pairs(options) do
  vim.opt[k] = v
end
