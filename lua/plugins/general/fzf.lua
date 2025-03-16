return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  opts = function(_, opts)
    local actions = require("fzf-lua.actions")
    return {
      keymap = {
        builtin = {
          true,
          ["<C-q>"] = "select-all+accept",
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down",
          ["<C-o>"] = "toggle-preview",
          ["<C-w>"] = "toggle-preview-wrap",
        },
      },
      winopts = {
        -- fullscreen = true,
        preview = {
          layout = "vertical",
          vertical = "up:65%",
        },
      },
      files = {
        actions = {
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
        },
      },
      grep = {
        actions = {
          ["ctrl-f"] = { fn = actions.toggle_ignore },
          ["ctrl-h"] = { fn = actions.toggle_hidden },
        }
      },
      git = {
        commits = {
          ["ctrl-y"] = { fn = actions.git_yank_commit },
        },
        status = {
          actions = {
            ["ctrl-s"] = { fn = actions.git_stage },
            ["ctrl-u"] = { fn = actions.git_unstage },
          }
        },
        branches = {
          actions = {
            ["ctrl-d"] = function(selected)
              require("diffview")
              vim.notify(selected)
              local branch = selected[1]
              vim.notify(branch)
              vim.cmd("DiffviewOpen " .. branch)
            end,
          },
        },
      },
    }
  end,
  keys = {
    { "<leader><leader>f", "<CMD>FzfLua<CR>",                            desc = "FzfLua" },
    { "<leader>sw",        "<CMD>FzfLua lsp_live_workspace_symbols<CR>", desc = "[S]ymbols [W]orkspace" },
    { "<leader>sd",        "<CMD>FzfLua lsp_document_symbols<CR>",       desc = "[S]ymbols [D]ocument" },
    { "<leader>fo",        "<CMD>FzfLua oldfiles<CR>",                   desc = "[F]ind recently [O]pened files" },
    { "<leader>fq",        "<CMD>FzfLua quickfix<CR>",                   desc = "[F]ind [Q]uickfix" },
    { "<leader>fj",        "<CMD>FzfLua jumps<CR>",                      desc = "[F]ind [J]umps" },
    { "<leader>ff",        "<CMD>FzfLua files<CR>",                      desc = "[F]ind [F]iles" },
    { "<leader>rt",        "<CMD>FzfLua resume<CR>",                     desc = "[R]esume [T]elescope" },
    { "<leader>fc",        "<CMD>FzfLua git_commits<CR>",                desc = "[F]ind Git [C]ommits" },
    { "<leader>fb",        "<CMD>FzfLua git_branches<CR>",               desc = "[F]ind Git [B]ranches" },
    { "<leader>fg",        "<CMD>FzfLua live_grep<CR>",                  desc = "[F]ind by [G]rep" },
    { "<leader>fd",        "<CMD>FzfLua lsp_workspace_diagnostics<CR>",  desc = "[F]ind [D]iagnostics" },
    { "<leader>fr",        "<CMD>FzfLua lsp_references<CR>",             desc = "[F]ind [R]eferences" },
    { "<leader>fi",        "<CMD>FzfLua lsp_implementations<CR>",        desc = "[F]ind [I]mplementations" },
    { "<leader>fk",        "<CMD>FzfLua keymaps<CR>",                    desc = "[F]ind [K]eymaps" },
    { "<leader>fh",        "<CMD>FzfLua help_tags<CR>",                  desc = "[F]ind [H]elp tags" },
    { "<leader>fs",        "<CMD>FzfLua git_status<CR>",                 desc = "[F]ind Git [S]tatus" },
    { "<leader>ch",        "<CMD>FzfLua command_history<CR>",            desc = "[C]ommands [H]istory" },
    { "<leader>fw",        "<CMD>FzfLua grep_cword<CR>",                 desc = "[F]ind [w]ord" },
    { "<leader>fW",        "<CMD>FzfLua grep_cWORD<CR>",                 desc = "[F]ind [W]ord" },
    {
      "<leader>fp",
      function()
        require('fzf-lua').files({ fzf_cli_args = '--query ' .. vim.fn.expand('<cWORD>') })
      end,
      desc = "[F]ind [P]ath"
    },
  },
}
