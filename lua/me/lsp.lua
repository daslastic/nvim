local s = safe_require("neodev")
if not s then
  return
end
s.setup()

local cmp_nvim = safe_require("cmp_nvim_lsp")
if not cmp_nvim then
  return
end

local lspconfig = require("lspconfig")

local M = {}

M.capabilities = cmp_nvim.default_capabilities()
M.servers = {
  awk_ls = {},
  bashls = {},
  clangd = {},
  cmake = {},
  eslint = {},
  golangci_lint_ls = {},
  html = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  jsonls = {},
  tsserver = {},
  julials = {},
  intelephense = {},
  pyright = {},
  tailwindcss = {},
  taplo = {},
  lemminx = {},
  yamlls = {},
  zls = {},
  rust_analyzer = {},
  svelte = {},
  vuels = {},
  tflint = {},
  terraformls = {},
  emmet_ls = {},
  cssls = {},
  cssmodules_ls = {},
  omnisharp = {},
}

M.keymaps = function(bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "<leader>as", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>aa", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>ad", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>ar", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("n", "<leader>af", function()
    vim.lsp.buf.format({ async = false })
  end, opts)
  vim.keymap.set("n", "<leader>aj", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "<leader>ak", function()
    vim.diagnostic.goto_prev()
  end, opts)

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end

M.on_attach = function(_, bufnr)
  M.keymaps(bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer" })

  local lsp_signature = safe_require("lsp_signature")
  if not lsp_signature then
    return
  end

  lsp_signature.on_attach({
    bind = true,
    floating_window_above_cur_line = true,
    handler_opts = {
      border = "none",
    },
  }, bufnr)
end

local mason = safe_require("mason")
if not mason then
  return
end

local mason_ls = safe_require("mason-lspconfig")
if not mason_ls then
  return
end

mason.setup()
mason_ls.setup({
  automatic_installation = true,
  ensure_installed = vim.tbl_keys(M.servers),
})

mason_ls.setup_handlers({
  function(server_name)
    if server_name == "rust_analyzer" then
      local rt = safe_require("rust-tools")
      if not rt then
        return
      end

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            M.on_attach(_, bufnr)
            vim.keymap.set("n", "<leader>aa", rt.code_action_group.code_action_group, { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<leader>ac", function() rt.open_cargo_toml.open_cargo_toml() end,
              { buffer = bufnr, remap = true })
          end,
        },
      })
      return
    end

    lspconfig[server_name].setup({
      capabilities = M.capabilities,
      on_attach = M.on_attach,
      settings = M.servers[server_name],
    })
  end,
})

return M
