return {
  "nvimtools/none-ls.nvim",
  keys = {
    { "<leader>ca", mode = { "n", "v" } }
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {

        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yamlfix,
        null_ls.builtins.formatting.goimports,

        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.hover.printenv,
      },
    })
  end,
}
