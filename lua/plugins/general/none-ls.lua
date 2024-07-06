return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = false,
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {

        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.ts_node_action,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yamlfix,

        -- python
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,

        null_ls.builtins.hover.printenv,
      },
    })
  end,
}
