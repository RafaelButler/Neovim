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
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- CMP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	--Theme
	use("marko-cerovac/material.nvim")
	use("arcticicestudio/nord-vim")
	use("Mofiqul/dracula.nvim")

	--Treesiter
	use("saadparwaiz1/cmp_luasnip")
	use("nvim-treesitter/nvim-treesitter")

	-- Auto pairs
	use("windwp/nvim-autopairs")

	--Comments
	use("terrortylor/nvim-comment")

	--Null ls
	use("jose-elias-alvarez/null-ls.nvim")

	-- NERDTREE
	use("preservim/nerdtree")
	use("ryanoasis/vim-devicons")

	-- Some snippets
	use("hrsh7th/vim-vsnip")

	--Toggle term
	use({ "akinsho/toggleterm.nvim" })

	-- Trouble
	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	--TabNine
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- GitSigns
	use("lewis6991/gitsigns.nvim")

	--Fugitive
	use("tpope/vim-fugitive")

	-- Git GV, its like Git Graph
	use("junegunn/gv.vim")

	-- BufferLine
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	--Highlight hex
	use("norcalli/nvim-colorizer.lua")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Preview markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	--LazyGit
	use("kdheepak/lazygit.nvim")

	--Prettier
	use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })

	--status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
