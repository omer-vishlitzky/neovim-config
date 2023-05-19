-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'sainnhe/gruvbox-material'
    use 'numToStr/Comment.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'theprimeagen/harpoon'
    use 'theprimeagen/refactoring.nvim'
    use 'savq/melange-nvim'
    use 'tpope/vim-fugitive'
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { { 'nvim-lua/plenary.nvim' } } }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
    --
    -- use { 'romgrk/barbar.nvim',
    --     requires = {
    --         'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --         'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --     }
    -- }
    --
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- -- Flutter
    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    }

    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
