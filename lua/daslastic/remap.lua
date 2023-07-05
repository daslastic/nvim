vim.g.mapleader = " "

-- telescope
local find =
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = true, hidden = true, no_ignore = true}))<cr>"
local grep =
	"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({previewer = true, hidden = true, no_ignore = true}))<cr>"
vim.keymap.set("n", "<leader>v", ":vsplit<cr>" .. find)
vim.keymap.set("n", "<leader>n", ":split<cr>" .. find)
vim.keymap.set("n", "<leader>q", ":qa!<cr>" .. find)
vim.keymap.set("n", "<leader>s", find, {})
vim.keymap.set("n", "<leader>S", grep, {})

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>z", ":ZenMode<cr>")
vim.keymap.set("n", "<leader>p", ":SearchSession<cr>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format({ async = false })<cr>")
vim.keymap.set("n", "<leader>fj", ":lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "<leader>fk", ":lua vim.diagnostic.goto_prev()<cr>")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- visual move tab, hl
vim.keymap.set("v", "<S-h>", "<gv")
vim.keymap.set("v", "<S-l>", ">gv")

-- ctrl swap
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
