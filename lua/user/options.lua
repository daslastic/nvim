local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = false,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  --expandtab = false,
  shiftwidth = 2,
  --tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 5,
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  sidescrolloff = 8,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
