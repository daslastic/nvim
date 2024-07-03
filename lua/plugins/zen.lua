return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        width = 80,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = true,
          cursorcolumn = false,
        },
      },
    },
    keys = {
      {
        "<leader>z",
        "<cmd>ZenMode<cr>",
        desc = "ZenMode Toggle",
      },
    },
  },
}
