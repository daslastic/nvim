return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      undercurl = false,
      underline = true,
      transparent_mode = true,
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
