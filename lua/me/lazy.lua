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
    "nvim-ts-context-commentstring",
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
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      "lvimuser/lsp-inlayhints.nvim",
      "ray-x/lsp_signature.nvim",

      -- other
      "folke/neodev.nvim",
      "nvimtools/none-ls.nvim",
    },
  },

  -- server
  {
    "saecki/crates.nvim",
    tag = 'v0.3.0',
    lazy = true,
  },

  "mfussenegger/nvim-jdtls",

  -- cozy
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
  },

  "folke/zen-mode.nvim",
  { "j-hui/fidget.nvim", lazy = true },
  "lervag/vimtex",

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   config = function() vim.fn["mkdp#util#install"]() end,
  -- }
})
