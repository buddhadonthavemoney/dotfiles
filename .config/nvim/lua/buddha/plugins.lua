-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    -- use{
    --     'dylanaraps/wal.vim',
    --     config = function()
    --         vim.cmd('colorscheme wal')
    --     end
    -- }

    -- use { 'mhartington/formatter.nvim' }
    use { "christoomey/vim-tmux-navigator" }
    use "nvim-tree/nvim-tree.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use 'windwp/nvim-ts-autotag'
    use('norcalli/nvim-colorizer.lua')
    use('github/copilot.vim')
    use('wbthomason/packer.nvim')
    use 'francoiscabrol/ranger.vim'
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use('mbbill/undotree')
    -- use {
    --     'itchyny/lightline.vim',
    -- }
    use 'ThePrimeagen/vim-be-good'

    use 'mhinz/vim-startify'
    -- use 'vim-airline/vim-airline'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- use 'terrortylor/nvim-comment'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "olimorris/onedarkpro.nvim",
        as = 'onedark-vivid',
        -- config = function()
        --     vim.cmd('colorscheme onedark_vivid')
        -- end
    }
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,

    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                -- Required
            { 'hrsh7th/cmp-nvim-lsp' },            -- Required
            { 'hrsh7th/cmp-buffer' },              -- Optional
            { 'hrsh7th/cmp-path' },                -- Optional
            { 'saadparwaiz1/cmp_luasnip' },        -- Optional
            { 'hrsh7th/cmp-nvim-lua' },            -- Optional
            { 'jose-elias-alvarez/null-ls.nvim' }, -- Optional
            { 'jay-babu/mason-null-ls.nvim' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
end)
