return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local s = require("telescope")
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
            ".direnv",
            "target",
            ".git",
            ".cache",
            -- vscode users
            ".vscode",
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
    end,
  },
}
