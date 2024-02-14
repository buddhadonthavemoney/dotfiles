-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	------------ COLORSCHEME ------------
	use {
		"olimorris/onedarkpro.nvim",
	}

	------------ NAVIGATION ------------
	use "nvim-tree/nvim-tree.lua"
	use ('ggandor/leap.nvim')
	use('mbbill/undotree')

	----------- TELESCOPE ------------
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim" },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	}

	------------ DEVELOPMENT ------------
	use 'voldikss/vim-floaterm'
	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end }
	use 'terrortylor/nvim-comment'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	------------ VISUALS ------------
	use 'mhinz/vim-startify'
	use { 'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,

	}

	------------ GIT ------------
	use {'f-person/git-blame.nvim' }
	use { 'tpope/vim-fugitive' }

	------------ LSP ------------  
	use {'github/copilot.vim' }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },       -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },   -- Required
			{ 'hrsh7th/cmp-buffer' },     -- Optional
			{ 'hrsh7th/cmp-path' },       -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },   -- Optional
			{ 'jose-elias-alvarez/null-ls.nvim' }, -- Optional
			{ 'jay-babu/mason-null-ls.nvim' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}
	-- dap autocomplete
	use {'rcarriga/cmp-dap' }

	------------ FORMATTER ------------
	use {
		"nvimdev/guard.nvim",
		requires = {
			"nvimdev/guard-collection",
		},
	}


	------------ DEBUGGER & TESTS ------------
	use { 'mfussenegger/nvim-dap' }
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
	use { 'mfussenegger/nvim-dap-python' }
	use { 'leoluz/nvim-dap-go' }

	------------ TMUX ------------
	use { "christoomey/vim-tmux-navigator" }

end)
