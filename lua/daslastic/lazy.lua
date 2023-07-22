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
	{ "windwp/nvim-autopairs", lazy = true },
	{ "numToStr/Comment.nvim" },

	-- editor
	"ellisonleao/gruvbox.nvim",
	"christoomey/vim-tmux-navigator",
	{ "mbbill/undotree", lazy = true },
	{ "folke/todo-comments.nvim", lazy = true },
	-- "lewis6991/gitsigns.nvim",
	{ "RRethy/vim-illuminate", lazy = true },
	{ "norcalli/nvim-colorizer.lua", lazy = true },

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
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-emoji" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "lvimuser/lsp-inlayhints.nvim" },
			{ "ray-x/lsp_signature.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },

			-- other
			{ "folke/neodev.nvim" },
		},
	},

	-- server
	{ "mfussenegger/nvim-jdtls" },
	{
		"saecki/crates.nvim",
		branch = "v0.3.0",
	},
	{ "lervag/vimtex" },

	-- dap
	{ "mfussenegger/nvim-dap", lazy = true },
	{ "rcarriga/nvim-dap-ui", lazy = true },

	-- text editing
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- cozy
	{ "folke/zen-mode.nvim" },
	{ "j-hui/fidget.nvim", tag = "legacy", lazy = true },
})
