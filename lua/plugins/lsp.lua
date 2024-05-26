return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/lsp_signature.nvim",
      "saecki/crates.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require("neodev").setup()
      local cmp_nvim = require("cmp_nvim_lsp")
      local lspconfig = require("lspconfig")

      vim.diagnostic.config {
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
      }

      local M = {}

      M.inlay_hints = false
      M.capabilities = cmp_nvim.default_capabilities()
      M.capabilities.textDocument.completion.completionItem.snippetSupport = true

      M.keymaps = function(bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)

        vim.keymap.set("n", "gl", function()
          vim.diagnostic.open_float()
        end, opts)

        vim.keymap.set('n', 'gh', function()
            M.inlay_hints = not M.inlay_hints
            vim.lsp.inlay_hint.enable(M.inlay_hints)
          end,
          { desc = "toggle inlay hints" })

        vim.keymap.set("n", "<leader>as", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)

        vim.keymap.set("n", "<leader>aa", function()
          vim.lsp.buf.code_action()
        end, opts)

        vim.keymap.set("n", "<leader>ad", function()
          vim.lsp.buf.references()
        end, opts)

        vim.keymap.set("n", "<leader>ar", function()
          vim.lsp.buf.rename()
        end, opts)

        vim.keymap.set("n", "<leader>af", function()
          vim.lsp.buf.format({ async = false })
        end, opts)

        vim.keymap.set("n", "<leader>aj", function()
          vim.diagnostic.goto_next()
        end, opts)

        vim.keymap.set("n", "<leader>ak", function()
          vim.diagnostic.goto_prev()
        end, opts)

        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
          vim.lsp.buf.hover()
        end, opts)

        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end

      M.on_attach = function(_, bufnr)
        vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

        M.keymaps(bufnr)

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer" })

        local lsp_signature = require("lsp_signature")

        lsp_signature.on_attach({
          bind = true,
          floating_window_above_cur_line = true,
          handler_opts = {
            border = "none",
          },
        }, bufnr)
      end

      -- all are installed and managed using nix
      -- I don't imagine a sane person would do this with anything
      -- other then nix

      lspconfig.nil_ls.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {},
      }

      lspconfig.gdscript.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {},
      }

      lspconfig.lua_ls.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {
          Lua = {
            telemetry = { enable = false },
            hint = {
              enable = true,
            },
          },
        },
      }

      lspconfig.clangd.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {
        },
      }

      lspconfig.html.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        init_options = {
          configurationSection = { "html", "htmldjango", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true
          },
          provideFormatter = true
        },
      }

      lspconfig.cssls.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {
        }
      }

      lspconfig.emmet_ls.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {
        },
      }

      lspconfig.tsserver.setup {
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        settings = {
        },
      }

      lspconfig.rust_analyzer.setup {
        capabilities = M.capabilities,
        on_attach = function(client, bufnr)
          M.on_attach(client, bufnr)
          require("crates").setup({})
        end,
        settings = {
          ['rust-analyzer'] = {
            files = {
              excludeDirs = { ".direnv" }
            }
          }
        }
      }
    end,
  },
}
