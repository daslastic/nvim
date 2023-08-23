local tmux = safe_require("tmux");
if not tmux then
  return
end

tmux.setup({
  resize = {
    enable_default_keybindings = false,
    resize_step_x = 2,
    resize_step_y = 2,
  }
})


vim.keymap.set("n", "<C-Up>", '<cmd>lua require("tmux").resize_top()<cr>')
vim.keymap.set("n", "<C-Down>", '<cmd>lua require("tmux").resize_bottom()<cr>')
vim.keymap.set("n", "<C-Left>", '<cmd>lua require("tmux").resize_left()<cr>')
vim.keymap.set("n", "<C-Right>", '<cmd>lua require("tmux").resize_right()<cr>')
