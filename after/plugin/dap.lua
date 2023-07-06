local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>")
vim.keymap.set("n", "<ledaer>di", "<cmd>lua require('dap').step_into()<cr>")
vim.keymap.set("n", "<ledaer>do", "<cmd>lua require('dap').step_over()<cr>")
vim.keymap.set("n", "<leader>dO", "<cmd>lua require('dap').step_out()<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl_toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>")
vim.keymap.set("n", "<leader>dx", "<cmd>lua require('dap').terminate()<cr>")
