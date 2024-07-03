return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
        prompt_prefix = " ",
        selection_caret = " ",
        file_ignore_patterns = {
          ".direnv",
          "target",
          ".git",
          ".cache",
          "%.ase",
          -- vscode users
          ".vscode",
        },
      },
    },
    keys = {
      {
        '<leader>%',
        '<cmd>lua require("global.telescope").split()<cr>',
        desc = "",
      },
      {
        '<leader>"',
        '<cmd>lua require("global.telescope").vsplit()<cr>',
        desc = "",
      },
      {
        '<leader>F',
        '<cmd>lua require("global.telescope").grep()<cr>',
        desc = "",
      },
      {
        '<leader>f',
        '<cmd>lua require("global.telescope").find()<cr>',
        desc = "",
      },
    },
  },
}
