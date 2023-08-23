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

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- patchy
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-h>", "<gv")
vim.keymap.set("v", "<S-l>", ">gv")
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste without yank
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- center
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
