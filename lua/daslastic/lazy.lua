local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local p = safe_require("lazy")
if not p then
  return
end

p.setup({
  "nvim-lua/plenary.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
  },

  { "windwp/nvim-ts-autotag", lazy = true },
  { "windwp/nvim-autopairs",  lazy = true },
  { "numToStr/Comment.nvim",  lazy = true },

  -- editor
  "ellisonleao/gruvbox.nvim",
  "christoomey/vim-tmux-navigator",
  "mbbill/undotree",
  { "folke/todo-comments.nvim",      lazy = true },
  { "lewis6991/gitsigns.nvim",       lazy = true },
  { "RRethy/vim-illuminate",         lazy = true },
  { "norcalli/nvim-colorizer.lua",   lazy = true },

  { "nvim-telescope/telescope.nvim", lazy = true },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp",                 lazy = true },
      { "hrsh7th/cmp-nvim-lsp",             lazy = true },
      { "hrsh7th/cmp-path",                 lazy = true },
      { "hrsh7th/cmp-emoji",                lazy = true },
      { "L3MON4D3/LuaSnip",                 lazy = true },
      { "rafamadriz/friendly-snippets",     lazy = true },
      { "saadparwaiz1/cmp_luasnip",         lazy = true },
      { "lvimuser/lsp-inlayhints.nvim",     lazy = true },
      { "ray-x/lsp_signature.nvim",         lazy = true },
      { "jose-elias-alvarez/null-ls.nvim",  lazy = true },

      -- other
      { "folke/neodev.nvim" },
    },
  },

  -- server
  { "mfussenegger/nvim-jdtls", lazy = true },
  {
    "saecki/crates.nvim",
    branch = "v0.3.0",
    lazy = true,
  },
  { "lervag/vimtex",           lazy = true },

  -- dap
  { "mfussenegger/nvim-dap",   lazy = true },
  { "rcarriga/nvim-dap-ui",    lazy = true },

  -- cozy
  { "folke/zen-mode.nvim",     lazy = true },
  { "j-hui/fidget.nvim",       tag = "legacy", lazy = true },

  -- sessions
  { "rmagatti/auto-session" },
  -- { "rmagatti/session-lens" },
})
