local tmux = safe_require("tmux");
if not tmux then
  return
end

tmux.setup()
