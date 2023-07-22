local s = safe_require("neodev")
if not s then
	return
end
s.setup()

local cmp_nvim = safe_require("cmp_nvim_lsp")
if not cmp_nvim then
	return
end

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim.default_capabilities(capabilities)

local servers = {
	awk_ls = {},
	bashls = {},
	clangd = {},
	cmake = {},
	eslint = {},
	golangci_lint_ls = {},
	html = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	jsonls = {},
	tsserver = {},
	julials = {},
	intelephense = {},
	pyright = {},
	tailwindcss = {},
	taplo = {},
	lemminx = {},
	yamlls = {},
	zls = {},
	rust_analyzer = {},
	svelte = {},
	vuels = {},
	tflint = {},
	terraformls = {},
	emmet_ls = {},
	cssls = {},
	cssmodules_ls = {},
}

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = vim.tbl_keys(servers),
})

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	local opts = { buffer = bufnr, remap = false }
	require("lsp_signature").on_attach({
		bind = true,
		floating_window_above_cur_line = true,
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>as", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
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
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
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
end

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- for _, server_name in ipairs(require("mason-lspconfig").get_installed_servers()) do
-- 	lspconfig[server_name].setup({
-- 		capabilities = capabilities,
-- 		on_attach = on_attach,
-- 		settings = servers[server_name],
-- 	})
-- end
