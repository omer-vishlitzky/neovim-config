return {
  'nvimtools/none-ls.nvim',
  lazy = false,
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.diagnostics.staticcheck,
      },
    })
  end
}
