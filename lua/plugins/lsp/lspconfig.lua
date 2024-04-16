return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Mason" },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/nvim-cmp',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
    { 'folke/neoconf.nvim', opts = {} },
  },
  config = function()
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
    vim.keymap.set('n', 'gt', require('telescope.builtin').lsp_type_definitions, { desc = '[G]oto Type [D]efinitions' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
    vim.keymap.set('n', '<leader>th', function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled()) end,
      { desc = '[T]oggle inlay [H]ints' })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    require('neodev').setup({})
    require('neoconf').setup({})
    require('mason').setup()
    require('mason-tool-installer').setup({})
    local servers = {
      rust_analyzer = {},

      gopls = {
        settings = {
          gopls = {
            ["ui.inlayhint.hints"] = {
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              functionTypeParameters = true,
              constantValues = true,
              parameterNames = true,
              assignVariableTypes = true,
              rangeVariableTypes = true,
            },
          },
        },
      },

    }

    require('mason-lspconfig').setup {
      ensure_installed = {
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "clangd",
        "pyright",
        "jsonls",
        "yamlls",
      },
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
