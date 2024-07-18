return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Mason" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/nvim-cmp",
    { "j-hui/fidget.nvim",  opts = {} },
    { "folke/neoconf.nvim", opts = {} },
  },
  config = function()
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "[G]oto [D]efition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
    vim.keymap.set("n", "gr", function()
      require("trouble").toggle("lsp_references")
    end, { desc = "[G]oto [R]eferences" })
    vim.keymap.set("n", "gI", telescope.lsp_implementations, { desc = "[G]oto [I]mplementation" })
    vim.keymap.set("n", "gt", telescope.lsp_type_definitions, { desc = "[G]oto Type [D]efinitions" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]sp [F]ormat" })

    vim.keymap.set("n", "<leader>th", function()
      ---@diagnostic disable-next-line: missing-parameter
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "[T]oggle inlay [H]ints" })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    require("neoconf").setup({})
    require("mason").setup()
    require("mason-tool-installer").setup({})
    local servers = {
      rust_analyzer = {},
      ruff = {},
      lua_ls = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
      clangd = {},
    }
    require("mason-lspconfig").setup({
      ensure_installed = {
        "rust_analyzer",
        "lua_ls",
        "zls",
        "gopls",
        "clangd",
        "ruff",
        "basedpyright",
        "pylsp",
        "jsonls",
        "yamlls",
      },
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
