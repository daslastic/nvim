-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see ":help vimtex-requirements" for more
-- info).
vim.cmd("filetype plugin indent on")

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.g.vimtex_view_method = "zathura"

-- Or with a generic interface:
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see ":help vimtex-compiler".
vim.g.vimtex_compiler_method = "latexmk"
