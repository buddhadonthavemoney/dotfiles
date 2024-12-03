-- Install Lazy.nvim if you haven't already
-- You can place this in your init.lua or a separate file
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "


-- Load Lazy.nvim and configure plugins
require('lazy').setup({
	------------ VISUALS ------------
	{ 'mhinz/vim-startify' },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		build = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
	},

	------------ COLORSCHEME ------------
	{ "olimorris/onedarkpro.nvim" },
	{ 'nyoom-engineering/oxocarbon.nvim' },
	{ 'rebelot/kanagawa.nvim' },

	------------ NAVIGATION ------------
	{ "nvim-tree/nvim-tree.lua" },
	{ 'ggandor/leap.nvim' },
	{ 'mbbill/undotree' },
	{ 'echasnovski/mini.nvim' },
	{ 'talha-akram/noctis.nvim' },
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},

	----------- TELESCOPE ------------
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim"
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	},

	------------ DEVELOPMENT ------------
	{ 'voldikss/vim-floaterm' },
	{
		"akinsho/toggleterm.nvim",
		version = '*',
		config = function()
			require("toggleterm").setup()
		end
	},
	{ 'terrortylor/nvim-comment' },
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	------------ GIT ------------
	{ 'f-person/git-blame.nvim' },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-dispatch' },

	------------ LSP ------------
	{ 'github/copilot.vim' },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
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
	},
	{ 'rcarriga/cmp-dap' },

	------------ FORMATTER ------------
	{
		"nvimdev/guard.nvim",
		dependencies = {
			"nvimdev/guard-collection",
		},
	},

	------------ DEBUGGER & TESTS ------------
	{ 'mfussenegger/nvim-dap' },
	{ "rcarriga/nvim-dap-ui",          dependencies = { "mfussenegger/nvim-dap" } },
	{ 'mfussenegger/nvim-dap-python' },
	{ 'leoluz/nvim-dap-go' },
	{ 'nvim-neotest/nvim-nio' },

	------------ TMUX ------------
	{ "christoomey/vim-tmux-navigator" },

	------------ MISC ------------
	{
		"iamcco/markdown-preview.nvim",
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{ 'tamton-aquib/duck.nvim' },
})
