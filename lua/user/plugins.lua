local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "none" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- very cool plugins
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	-- files
	use("tamago324/lir.nvim")

	-- telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("nvim-treesitter/nvim-treesitter")
	use("jose-elias-alvarez/null-ls.nvim")
	use("nix-community/rnix-lsp")
	use("ray-x/lsp_signature.nvim")
	use("RRethy/vim-illuminate")
	use("windwp/nvim-ts-autotag")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("b0o/SchemaStore.nvim")
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	})
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("user.copilot")
			end, 100)
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
	})

	-- cmp
	use({ "hrsh7th/nvim-cmp" })
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})
	use("simrat39/rust-tools.nvim")
	use({
		"saecki/crates.nvim",
		tag = "v0.2.1",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})

	-- speed lol
	use("lewis6991/impatient.nvim")

	-- snip
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- other
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("folke/todo-comments.nvim")
	-- tools
	use("mfussenegger/nvim-dap")

	-- colorschemes
	use("ellisonleao/gruvbox.nvim")

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
