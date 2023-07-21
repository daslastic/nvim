vim.cmd("setlocal tabstop=4 shiftwidth=4")

local home = os.getenv("HOME")
local nvim = vim.fn.glob(home .. "/.local/share/nvim/")
local jdtls = G.safe_require("jdtls")
if not jdtls then
	return
end

if vim.fn.has("mac") == 1 then
	local utils = nvim .. "lib"

	local jdtls_lib = "/opt/homebrew/opt/jdtls/libexec"

	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

	local workspace_dir = home .. nvim .. "jdtls-workspace" .. project_name

	-- This bundles definition is the same as in the previous section (java-debug installation)
	local bundles = {
		vim.fn.glob(
			utils .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
			1
		),
	}

	-- This is the new part
	vim.list_extend(bundles, vim.split(vim.fn.glob(utils .. "/vscode-java-test/server/*.jar", 1), "\n"))

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = false
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

		-- 💀
		-- This is the default if not provided, you can remove it. Or adjust as needed.
		-- One dedicated LSP server & client will be started per unique root_dir
		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
		capabilities = capabilities,

		-- Here you can configure eclipse.jdt.ls specific settings
		-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
		-- for a list of options
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
						enabled = "all", -- literals, all, none
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
					"org.junit.Assert.*",
					"org.junit.Assume.*",
					"org.junit.jupiter.api.Assertions.*",
					"org.junit.jupiter.api.Assumptions.*",
					"org.junit.jupiter.api.DynamicContainer.*",
					"org.junit.jupiter.api.DynamicTest.*",
				},
				importOrder = {
					"java",
					"javax",
					"com",
					"org",
				},
			},
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

		-- Language server `initializationOptions`
		-- You need to extend the `bundles` with paths to jar files
		-- if you want to use additional eclipse.jdt.ls plugins.
		--
		-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
		--
		-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
		init_options = {
			bundles = bundles,
		},
	}

	vim.keymap.set("n", "<Leader>co", "<cmd>lua require('jdtls').organize_imports()<cr>")
	vim.keymap.set("n", "<Leader>cv", "<cmd>lua require('jdtls').extract_variable()<cr>")
	vim.keymap.set("n", "<Leader>cc", "<cmd>lua require('jdtls').extract_const()<cr>")
	vim.keymap.set("n", "<Leader>ct", "<cmd>lua require('jdtls').test_nearest_method()<cr>")
	vim.keymap.set("n", "<Leader>cT", "<cmd>lua require('jdtls').test_class()<cr>")
	vim.keymap.set("n", "<Leader>cu", "<cmd>JdtUpdateConfig<cr>")

	config["on_attach"] = function(client, bufnr)
		require("lsp_signature").on_attach({
			bind = true,
			floating_window_above_cur_line = true,
			padding = "",
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)
		require("jdtls").setup_dap({ hotcodereplace = "auto" })
	end

	jdtls.start_or_attach(config)
end
