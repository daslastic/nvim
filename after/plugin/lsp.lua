local s = safe_require("neodev")
if not s then
	return
end
s.setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lsp = safe_require("lsp-zero")
if not lsp then
	return
end

lsp.preset({
	manage_nvim_cmp = {
		set_sources = "recommended",
	},
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
	"awk_ls", -- AWK --
	"bashls", -- Bash --
	"clangd", -- C & C++ --
	"cmake", -- CMake --
	"eslint", -- ESLint --
	"golangci_lint_ls", -- Go --
	"html", -- HTML --
	"lua_ls", --
	"jsonls", -- Json --
	"tsserver", -- Javascript/Typescript --
	"julials", -- Julia --
	"intelephense", -- PHP --
	"pyright", -- Python --
	"tailwindcss", -- Tailwind --
	"taplo", -- TOML --
	"lemminx", -- XML --
	"yamlls", -- YAML --
	"zls", -- Zig --
	"rust_analyzer", -- Rust
	"svelte", -- Svelte
	"vuels", -- Vue
	"tflint", --
	"terraformls", --
	"emmet_ls", -- Emmet --
	"cssls", -- CSS --
	"cssmodules_ls", --
})

lsp.set_sign_icons({
	error = " ",
	warn = " ",
	hint = "󰞂",
	info = "",
})

lsp.on_attach(function(client, bufnr)
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
end)

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

local luasnip = safe_require("luasnip.loaders.from_vscode")
if not luasnip then
	return
end
luasnip.lazy_load()

cmp.setup({
	mapping = {
		["<Tab>"] = cmp_action.tab_complete(),
		["<Return>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		--    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		--    ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
		["<C-k>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
		["<C-j>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "emoji" },
		{ name = "dap" },
	},
})

lsp.setup()
