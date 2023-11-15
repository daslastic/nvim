local none_ls = safe_require("null-ls")
if not none_ls then
  return
end

none_ls.setup({
  sources = {
    none_ls.builtins.formatting.prettier.with({
      filetypes = { "css", "scss" },
    }),
  },
})
