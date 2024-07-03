return {
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      floating_window_above_cur_line = true,
      handler_opts = {
        border = "none",
      },
    },
    config = function(_, opts)
      require 'lsp_signature'.setup(opts)
    end,
  },
  { "j-hui/fidget.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "mfussenegger/nvim-lint",
      "stevearc/conform.nvim",
    },
    opts = {
      lua_ls = {
        telemetry = { enable = false },
        hint = {
          enable = true,
        },
      },
      rust_analyzer = {
        files = {
          excludeDirs = { ".direnv" },
        },
      },
    },
    config = function(_, opts)
      require("neodev").setup()

      local lspconfig = require("lspconfig")
      local lsp = require("global.lsp")

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        float = {
          border = "none",
        },
      })

      require("conform").setup({
        formatters_by_ft = {
          ["*"] = { "trim_newlines" },
          json = { "jq" },
          nix = { "nixfmt" },
          sh = { "shfmt" },
          yaml = { "yq" },
        },
      })

      require("lint").linters_by_ft = {
        ["*"] = { "editorconfig-checker" },
        markdown = { "vale" },
        nix = { "statix" },
        python = { "ruff", "mypy" },
        sh = { "shellcheck" },
      }

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWrite", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      lspconfig.gdscript.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {},
      })

      lspconfig.nil_ls.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {},
      })

      lspconfig.lua_ls.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {
          Lua = opts.lua_ls,
        },
      })

      lspconfig.clangd.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {},
      })

      lspconfig.html.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
      })

      lspconfig.cssls.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {},
      })

      lspconfig.emmet_ls.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {},
      })

      lspconfig.tsserver.setup({
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        settings = {},
      })

      require("lspconfig").rust_analyzer.setup({
        capabilities = lsp.capabilities,
        on_attach = function(client, bufnr)
          lsp.on_attach(client, bufnr)
          require("crates").setup({})
        end,
        settings = {
          ["rust_analyzer"] = opts.rust_analyzer,
        },
      })
    end,
  },
}
