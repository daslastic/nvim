require("session-lens").setup({})
require("telescope").load_extension("session-lens")
require("auto-session").setup({
  auto_session_enable_last_session = true,
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_use_git_branch = false,
  session_lens = {
    load_on_setup = true,
    theme_conf = { border = false },
    previewer = false,
  },
})
