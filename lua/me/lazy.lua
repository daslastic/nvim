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
      -- "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
  },

  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",

  -- editor
  "ellisonleao/gruvbox.nvim",
  "nvim-telescope/telescope.nvim",
  "mbbill/undotree",
  "folke/todo-comments.nvim",
  -- "RRethy/vim-illuminate",
  "norcalli/nvim-colorizer.lua",
  "nvim-lualine/lualine.nvim",

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
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "mtoohey31/cmp-fish",
      "andersevenrud/cmp-tmux",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      "lvimuser/lsp-inlayhints.nvim",
      "ray-x/lsp_signature.nvim",
      -- "jose-elias-alvarez/null-ls.nvim",

      -- other
      "folke/neodev.nvim",
      "nvimtools/none-ls.nvim",
    },
  },

  -- server
  { "mfussenegger/nvim-jdtls", lazy = true },
  {
    "saecki/crates.nvim",
    tag = 'v0.3.0',
    event = { "BufRead Cargo.toml" },
    lazy = true,
  },

  -- {
  --   'simrat39/rust-tools.nvim',
  -- },

  -- cozy
  "folke/zen-mode.nvim",
  "lervag/vimtex",
  { "j-hui/fidget.nvim",       tag = "legacy", lazy = true },

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   config = function() vim.fn["mkdp#util#install"]() end,
  -- }
})
