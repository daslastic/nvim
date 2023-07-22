-- local session_lens = safe_require("session-lens")
-- if not session_lens then
--   return
-- end

local telescope = safe_require("telescope")
if not telescope then
  return
end

local auto_session = safe_require("auto-session")
if not auto_session then
  return
end

-- session_lens.setup({})
telescope.load_extension("session-lens")
auto_session.setup({
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


-- vim.keymap.set("n", "<leader>p", ":SearchSession<cr>") -- tmux does this for me, shouldn't use this
