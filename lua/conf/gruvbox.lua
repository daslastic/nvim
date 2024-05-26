return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        undercurl = false,
        underline = false,
        overrides = {
          SignColumn = { bg = "#32302f" },
          LineNr = { bg = "#32302f" }
        },
        contrast = "hard",
        transparent_mode = false,
      })

      vim.cmd.colorscheme("gruvbox")
    end,
  }
}
