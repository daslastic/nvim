vim.g.mapleader = " "

vim.keymap.set("n", "<leader>x", "<cmd>qa!<cr>")
vim.keymap.set("n", "<leader>R", "<cmd>!chmod +x %<cr>", { silent = true })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>5", function()
  vim.cmd('vsplit')
end)
vim.keymap.set("n", "<leader>'", function()
  vim.cmd('split')
end)

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
