vim.g.mapleader = " "

local find =
"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = true, hidden = true, no_ignore = true}))<cr>"
local grep =
"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({previewer = true, hidden = true, no_ignore = true}))<cr>"

vim.keymap.set("n", "<leader>%", ":vsplit<cr>" .. find)
vim.keymap.set("n", '<leader>"', ":split<cr>" .. find)
vim.keymap.set("n", "<leader>x", ":qa!<cr>" .. find)
vim.keymap.set("n", "<leader>f", find, {})
vim.keymap.set("n", "<leader>F", grep, {})

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>z", ":ZenMode<cr>")
-- vim.keymap.set("n", "<leader>p", ":SearchSession<cr>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- visual move tab, hl
vim.keymap.set("v", "<S-h>", "<gv")
vim.keymap.set("v", "<S-l>", ">gv")
