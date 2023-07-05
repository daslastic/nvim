vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
	})

	-- treesitter
	use("windwp/nvim-ts-autotag")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("numToStr/Comment.nvim")

	-- editor
	use("mbbill/undotree")
	use("folke/todo-comments.nvim")
	use("lewis6991/gitsigns.nvim")

	-- editor sessions
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")

	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })

	use("ellisonleao/gruvbox.nvim")
	use("folke/zen-mode.nvim")
	use("nvim-lualine/lualine.nvim")

	-- dumb fun
	use("tamton-aquib/duck.nvim")

	use("m4xshen/hardtime.nvim")
	use("ThePrimeagen/vim-be-good")
	use("psliwka/vim-smoothie")

	-- lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			},

			-- Pictograms
			{ "onsails/lspkind.nvim" },

			-- Other
			{ "folke/neodev.nvim" },
		},
	})

	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")
	use("jose-elias-alvarez/null-ls.nvim")
	use("mfussenegger/nvim-jdtls")

	-- TODO: DAP ME
end)
