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
