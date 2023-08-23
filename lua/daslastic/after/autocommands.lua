vim.cmd([[
augroup format_on_save
  autocmd!
  autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
augroup end
]])

-- avoid auto comments on insert -- betterw way pzl?
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- lazy crates
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    local crates = safe_require("crates")
    if not crates then
      return
    end

    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
  end,
})
