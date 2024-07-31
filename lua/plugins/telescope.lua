return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
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
        '<cmd>lua require("global.telescope").vsplit()<cr>',
        desc = "",
      },
      {
        '<leader>"',
        '<cmd>lua require("global.telescope").split()<cr>',
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
