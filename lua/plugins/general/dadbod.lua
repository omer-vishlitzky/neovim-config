return {
  -- Database interface for Neovim
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "DB Find Buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB Rename Buffer" },
      { "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", desc = "DB Last Query Info" },
    },
    config = function()
      -- DB UI Settings
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 40

      -- Save queries in a dedicated directory
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui_queries"

      -- Auto-execute on save
      vim.g.db_ui_auto_execute_table_helpers = 1

      -- Disable mappings (we define our own)
      vim.g.db_ui_disable_mappings = 0

      -- Set up dadbod completion for SQL files
      -- Use omnifunc which blink.cmp will automatically pick up
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.bo.omnifunc = "vim_dadbod_completion#omni"
        end,
      })
    end,
  },
}
