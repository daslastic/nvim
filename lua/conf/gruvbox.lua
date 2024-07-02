return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        undercurl = false,
        underline = true,
        contrast = "hard",
        transparent_mode = true,
      })

      vim.cmd.colorscheme("gruvbox")
    end,
  }
}
