local M = {}


function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        profile = {
            enable = true,
            threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
        }
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost packer.lua source <afile> | PackerCompile"
    end

    -- Plugins
    local function plugins(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Colorschemes
        use 'savq/melange-nvim'
        use 'ellisonleao/gruvbox.nvim'
        use({ 'rose-pine/neovim', as = 'rose-pine' })

        -- General
        use 'norcalli/nvim-colorizer.lua'
        use 'theprimeagen/harpoon'
        use 'tpope/vim-sleuth'
        use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { { 'nvim-lua/plenary.nvim' } } }
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { "ray-x/lsp_signature.nvim" }
        use {
            "ThePrimeagen/refactoring.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-treesitter/nvim-treesitter" }
            }
        }

        use {
            "numToStr/Comment.nvim",
            opt = true,
            keys = { "gc", "gcc", "gbc" },
            config = function()
                require("Comment").setup {}
            end,
        }

        use 'windwp/nvim-ts-autotag'

        use {
            "nvim-tree/nvim-tree.lua",
            requires = { 'nvim-tree/nvim-web-devicons' },
            cmd = { "NvimTreeToggle" },
            config = function()
                -- require('omer.nvimtree').setup()
                dofile(vim.fn.stdpath('config') .. '/after/plugin/nvimtree.lua').setup()
            end,
        }

        -- Buffer line
        use {
            "akinsho/nvim-bufferline.lua",
            event = "BufReadPre",
            wants = "nvim-web-devicons",
            config = function()
                -- require("omer.bufferline").setup()
                dofile(vim.fn.stdpath('config') .. '/after/plugin/bufferline.lua').setup()
            end,
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

        -- Flutter
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

        -- Markdown
        use {
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
            ft = "markdown",
            cmd = { "MarkdownPreview" },
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
            -- cmd = "Trouble",
            requires = "nvim-tree/nvim-web-devicons",
            config = function()
                require("trouble").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

        use({
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
        })

        -- Additional lua configuration, makes nvim stuff amazing!
        use 'folke/neodev.nvim'

        use 'lewis6991/gitsigns.nvim'

        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = function()
                dofile(vim.fn.stdpath('config') .. '/after/plugin/lsplines.lua').setup()
            end,
        })

        -- Packer
        use "sindrets/diffview.nvim"

        -- Debugger
        use 'mfussenegger/nvim-dap'
        use 'rcarriga/nvim-dap-ui'

        -- Bootstrap Neovim
        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    packer_init()

    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)
end

return M
