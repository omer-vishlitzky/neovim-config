return {
  "folke/snacks.nvim",
  priority = 1000,
  enabled = false,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
        "<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
  keys = {
    { "<leader>gl", function() Snacks.picker.git_log() end,                desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,           desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,             desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,              desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,               desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,           desc = "Git Log File" },

    { "<leader>gp", function() Snacks.picker.gh_pr() end,                  desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },

    { "<leader>sp", function() Snacks.picker.lazy() end,                   desc = "Search for Plugin Spec" },

    { "<leader>sq", function() Snacks.picker.qflist() end,                 desc = "Quickfix List" },
    { "<leader>z",  function() Snacks.zen() end,                           desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end,                      desc = "Toggle Zoom" },

    { "<leader>cR", function() Snacks.rename.rename_file() end,            desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                     desc = "Git Browse",                 mode = { "n", "v" } },
    { "<c-/>",      function() Snacks.terminal() end,                      desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]r",         function() Snacks.words.jump(vim.v.count1) end,        desc = "Next Reference",             mode = { "n", "t" } },
    { "[r",         function() Snacks.words.jump(-vim.v.count1) end,       desc = "Prev Reference",             mode = { "n", "t" } },

  },
  ---@type snacks.Config
  opts = {
    git = { enabled = true },
    gh = { enabled = true },
    debug = { enabled = true },
    dim = { enabled = true },
    gitbrowse = { enabled = true },
    layout = { enabled = true },
    profiler = { enabled = true },
    scope = { enabled = true },
    terminal = { enabled = true },
    win = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
}
