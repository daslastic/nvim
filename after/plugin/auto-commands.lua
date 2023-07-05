vim.cmd([[
augroup format_on_save
  autocmd!
  autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
augroup end
]])
