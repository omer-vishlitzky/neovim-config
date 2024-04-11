return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efition' })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
    vim.keymap.set('n', '<leader>td', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
    vim.keymap.set('n', '<leader>th', function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled()) end, { desc = '[T]oggle inlay [H]ints' })


    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    local neodev = require("neodev")
    neodev.setup({})
    local servers = {
      clangd = {},
      gopls = {
        settings = {
          gopls = {
            ["ui.inlayhint.hints"] = {
              compositeLiteralFields = true,
              constantValues = true,
              parameterNames = true,
              assignVariableTypes = true
            },
          },
        },
      },
      pyright = {},
      rust_analyzer = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            hint = { enable = true }
          },
        },
      },
    }
    require('mason').setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          lspconfig[server_name].setup(server)
        end,
      },
    }
  end,
}
