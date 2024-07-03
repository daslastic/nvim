local M = {}
M.conform = require("conform")

M.inlay_hints = false
M.capabilities = nil

if pcall(require, "cmp_nvim_lsp") then
  M.capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
end

M.format = function(bufnr)
  M.conform.format({ bufnr, lsp_fallback = true })
end

M.keymaps = function(bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)

  vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
  end, opts)

  vim.keymap.set("n", "gh", function()
    M.inlay_hints = not M.inlay_hints
    vim.lsp.inlay_hint.enable(M.inlay_hints)
  end, { desc = "toggle inlay hints" })

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
    M.format(bufnr)
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
  vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

  M.keymaps(bufnr)

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    M.format(bufnr)
  end, { desc = "Format current buffer" })
end

return M
