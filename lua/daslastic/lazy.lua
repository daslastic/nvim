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

	"windwp/nvim-ts-autotag",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	"numToStr/Comment.nvim",

	-- editor
	"christoomey/vim-tmux-navigator",
	"ellisonleao/gruvbox.nvim",
	"andymass/vim-matchup",
	"mbbill/undotree",
	"folke/todo-comments.nvim",
	"lewis6991/gitsigns.nvim",
	"RRethy/vim-illuminate",
	"norcalli/nvim-colorizer.lua",

	"nvim-telescope/telescope.nvim",

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
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
			{ "hrsh7th/cmp-emoji" },
			{ "L3MON4D3/LuaSnip" },

			-- other
			{ "folke/neodev.nvim" },
		},
	},

	"lvimuser/lsp-inlayhints.nvim",
	"ray-x/lsp_signature.nvim",
	"rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip",
	"jose-elias-alvarez/null-ls.nvim",
	"mfussenegger/nvim-jdtls",

	{
		"saecki/crates.nvim",
		branch = "v0.3.0",
	},

	-- dap
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",

	-- text editing
	"lervag/vimtex",
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	config = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- },

	-- cozy
	"folke/zen-mode.nvim",
	"nvim-lualine/lualine.nvim",
	{ "j-hui/fidget.nvim", tag = "legacy" },
})
