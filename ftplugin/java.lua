vim.cmd("setlocal tabstop=4 shiftwidth=4")

local jdtls = safe_require("jdtls")
if not jdtls then
  return
end

local home = os.getenv("HOME")
local nvim = vim.fn.glob(home .. "/.local/share/nvim/")

if vim.fn.has("mac") == 1 then
  local utils = nvim .. "lib"
  local jdtls_lib = "/opt/homebrew/opt/jdtls/libexec"
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = nvim .. "jdtls-workspace" .. project_name

  local bundles = {
    vim.fn.glob(
      utils .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
      1
    ),
  }
  vim.list_extend(bundles, vim.split(vim.fn.glob(utils .. "/vscode-java-test/server/*.jar", 1), "\n"))

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities()
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local config = {
    cmd = {
      "java", -- or '/path/to/java17_or_newer/bin/java'
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      jdtls_lib .. "/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar",
      "-configuration",
      jdtls_lib .. "/config_mac",
      "-data",
      workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    on_attach = function(_, bufnr)
      jdtls.setup_dap({ hotcodereplace = "auto" })
      vim.lsp.codelens.refresh()

      vim.keymap.set("n", "<Leader>co", "<cmd>lua require('jdtls').organize_imports()<cr>")
      vim.keymap.set("n", "<Leader>cv", "<cmd>lua require('jdtls').extract_variable()<cr>")
      vim.keymap.set("n", "<Leader>cc", "<cmd>lua require('jdtls').extract_const()<cr>")
      vim.keymap.set("n", "<Leader>ct", "<cmd>lua require('jdtls').test_nearest_method()<cr>")
      vim.keymap.set("n", "<Leader>cT", "<cmd>lua require('jdtls').test_class()<cr>")
      vim.keymap.set("n", "<Leader>cu", "<cmd>JdtUpdateConfig<cr>")

      require("daslastic.lsp").on_attach(_, bufnr)
    end,
    capabilities = capabilities,

    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = "interactive",
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
        },
        format = {
          enabled = true,
        },
      },
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {
          "java.awt.image.*",
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
      },
      contentProvider = { preferred = "fernflower" },
      extendedClientCapabilities = extendedClientCapabilities,
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
    flags = {
      allow_incremental_sync = true,
    },
    init_options = {
      bundles = bundles,
    },
  }

  jdtls.start_or_attach(config)
end
