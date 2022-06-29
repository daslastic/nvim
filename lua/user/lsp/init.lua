-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local cmp_status_ok, lspconfig = pcall(require, "lspconfig")
if not cmp_status_ok then
  return
end

require "user.lsp.lsp-signature"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
lspconfig.pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig.tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
lspconfig.rnix.setup{}
