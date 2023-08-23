local rt = safe_require("rust-tools")
if not rt then
  return
end

rt.setup({
  tools = {
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
  },

  hover_actions = {
    border = "none",
    max_width = nil,
    max_height = nil,
    auto_focus = false,
  },

  server = {
    on_attach = function(_, bufnr)
      require("daslastic.lsp").on_attach(_, bufnr)
    end,
  },
})

local crates = safe_require("crates")
if not crates then
  return
end

crates.setup()
