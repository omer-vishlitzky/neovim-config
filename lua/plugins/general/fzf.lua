return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  cmd = { "FzfLua" },
  keys = {
    {"<leader>sb"},
    {"<leader>sd"},
    {"<leader>si"}, -- new key for interfaces
    {"<leader>st"}, -- new key for structs/types
  },
  config = function()
    local function symbols_with_filter(filter)
      return function()
        require('fzf-lua').lsp_live_workspace_symbols({
          symbol_filter = filter
        })
      end
    end

    vim.keymap.set('n', '<leader>sb', '<cmd>FzfLua lsp_document_symbols<cr>', {
      desc = 'Buffer symbols',
    })
    vim.keymap.set('n', '<leader>sd', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', {
      desc = 'Dynamic/workspace symbols',
    })
    
    -- Add filtered symbol searches
    vim.keymap.set('n', '<leader>si', symbols_with_filter("interface"), {
      desc = 'Interface symbols',
    })
    vim.keymap.set('n', '<leader>st', symbols_with_filter("struct"), {
      desc = 'Struct symbols',
    })
  end
}
