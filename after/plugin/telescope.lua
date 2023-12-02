local s = safe_require "telescope"
if not s then
  return
end

local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'
local actions = require 'telescope.actions'

s.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    prompt_prefix = " ",
    selection_caret = " ",
    file_ignore_patterns = {
      ".DS_Store",
      ".git/",
      "/.svelte-kit/",
      "target/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "env/",
      "gradle/",
      "node_modules/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
    },
  },
})

local opts = {
  previewer = true,
  hidden = true,
  no_ignore = false,
}

vim.keymap.set("n", "<leader>%", function()
  vim.cmd('vsplit')
  vim.cmd('Ex')
  builtin.find_files(themes.get_dropdown(opts))
end)
vim.keymap.set("n", '<leader>"', function()
  vim.cmd('split')
  vim.cmd('Ex')
  builtin.find_files(themes.get_dropdown(opts))
end)

vim.keymap.set("n", "<leader>F", function() builtin.live_grep(themes.get_dropdown(opts)) end, {})
vim.keymap.set('n', '<leader>f', function() builtin.find_files(themes.get_dropdown(opts)) end, {})
