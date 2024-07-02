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
  smartindent = false,
  inccommand = "split";
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
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  title = true,
  undofile = true,
  undodir = os.getenv("HOME") .. "/.cache/vimundo",
  hlsearch = false,
  incsearch = true,
}

vim.g.netrw_list_hide = '.DS_Store,.*.o$'

for k, v in pairs(options) do
  vim.opt[k] = v
end
