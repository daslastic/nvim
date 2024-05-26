return {
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").opts = {
        window = {
          backdrop = 1,
          width = 120,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = true,
            cursorcolumn = false,
          },
        },
      }
    end,
  }
}
