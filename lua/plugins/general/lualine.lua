return {
  "nvim-lualine/lualine.nvim",
  -- event = { "BufReadPost", "BufNewFile" },
  event = { "VeryLazy" },
  opts = {
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = true, -- displays file status (readonly status, modified status)
          path = 2,           -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      },
    },
  },
}
