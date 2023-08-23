local rt = safe_require("rust-tools")
if not rt then
  return
end

rt.setup({
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
