return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "FzfLua" },
  opts = function(_, opts)
    local actions = require("fzf-lua.actions")
    return {
      keymap = {
        builtin = {
          true,
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down",
          ["<C-o>"] = "toggle-preview",
          ["<C-w>"] = "toggle-preview-wrap",
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept",
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
        rg_glob = true,            -- enable glob parsing
        glob_flag = "--iglob",     -- case insensitive globs
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
        actions = {
          -- ["ctrl-f"] = { fn = actions.toggle_ignore },
          ["ctrl-h"] = { fn = actions.toggle_hidden },
          ["ctrl-f"] = { fn = actions.grep_lgrep },
        }
      },
      git = {
        commits = {
          ["ctrl-y"] = { fn = actions.git_yank_commit },
          actions = {
            ["ctrl-d"] = function(selected)
              require("diffview")
              vim.notify(selected)
              local branch = selected[1]
              vim.notify(branch)
              vim.cmd("DiffviewOpen " .. branch)
            end,
          }
        },
        status = {
          actions = {
            ["ctrl-s"] = { fn = actions.git_stage },
            ["ctrl-S"] = { fn = actions.git_unstage },
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
    {
      "<leader>fB",
      function()
        local file = vim.fn.expand("%:.")
        if file == "" then return vim.notify("No file open", vim.log.levels.WARN) end
        local fzf = require("fzf-lua")
        fzf.fzf_exec("git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads refs/remotes refs/tags", {
          prompt = "Open " .. file .. " from> ",
          preview = "git show {}:" .. file .. " 2>/dev/null",
          actions = {
            ["default"] = function(selected)
              local ref = selected[1]
              local content = vim.fn.systemlist("git show " .. ref .. ":" .. file)
              if vim.v.shell_error ~= 0 then return vim.notify(file .. " doesn't exist in " .. ref, vim.log.levels.ERROR) end
              vim.cmd("enew")
              vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
              vim.bo.buftype = "nofile"
              vim.bo.bufhidden = "wipe"
              vim.bo.modifiable = false
              vim.api.nvim_buf_set_name(0, ref .. ":" .. file)
              local ft = vim.filetype.match({ filename = file })
              if ft then vim.bo.filetype = ft end
            end,
          },
        })
      end,
      desc = "[F]ind current file from [B]ranch/ref",
    },
    { "<leader>ch",        "<CMD>FzfLua command_history<CR>",            desc = "[C]ommands [H]istory" },
    { "<leader>fw",        "<CMD>FzfLua grep_cword<CR>",                 desc = "[F]ind [w]ord" },
    { "<leader>fW",        "<CMD>FzfLua grep_cWORD<CR>",                 desc = "[F]ind [W]ord" },
    { "<leader>fm",        "<CMD>FzfLua manpages<CR>",                   desc = "[F]ind [M]anpages" },
    {
      "<leader>fp",
      function()
        require('fzf-lua').files({ fzf_cli_args = '--query ' .. vim.fn.expand('<cWORD>') })
      end,
      desc = "[F]ind [P]ath"
    },
    {
      "<leader>fP",
      function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
        require('fzf-lua').live_grep({ search = filename })
      end,
      desc = "[F]ind [P]ath"
    },
  },
}
