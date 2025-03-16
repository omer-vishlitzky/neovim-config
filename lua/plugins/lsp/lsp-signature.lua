return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach", -- This ensures it loads when an LSP client attaches
  opts = {
    bind = true, -- This is mandatory, otherwise border config won't get registered
    handler_opts = {
      border = "rounded" -- Double, rounded, single, shadow, none
    },
    hint_enable = true,
    hint_prefix = "🐼 ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter", -- How your parameter will be highlighted
    max_height = 12,
    max_width = 120,
    floating_window = true,
    floating_window_above_cur_line = true,
    floating_window_off_x = 1, -- Adjust float windows x position
    floating_window_off_y = 0, -- Adjust float windows y position
    fix_pos = false, -- Set to true if you want the floating window to stay in place
    doc_lines = 10, -- Will show lines of document/signature in floating window
    always_trigger = false, -- Default to false, set to true if you want signature to appear even if you're on different line than function call
    timer_interval = 200, -- Default timer check interval
    zindex = 200, -- By default it will be on top of all floating windows
    toggle_key = '<C-s>', -- Toggle signature on and off in insert mode, e.g. '<M-x>'
  },
  config = function(_, opts)
    -- Setup the plugin with the provided options
    require("lsp_signature").setup(opts)
    
    -- This ensures it's attached to all active LSP clients
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        -- Only attach if buffer has LSP client
        if vim.lsp.get_clients({ bufnr = bufnr })[1] then
          require("lsp_signature").on_attach(opts, bufnr)
        end
      end,
    })
  end,
}
