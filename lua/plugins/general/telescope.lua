---comment
---@param diff_command string
---@return function
local function diff(diff_command)
  return function()
    -- Open in diffview

    local action_state = require('telescope.actions.state')
    local selected_entry = action_state.get_selected_entry()
    local value = selected_entry.value
    -- close Telescope window properly prior to switching windows
    require("diffview")
    vim.api.nvim_win_close(0, true)
    vim.cmd("stopinsert")
    vim.schedule(function()
      vim.cmd((diff_command):format(value))
    end)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  keys = {
    { "<leader>f", mode = { "n" } },
    { "<leader>ch", mode = { "n" } },
  },
  cmd = {
    "Telescope",
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        local telescope = require("telescope")
        telescope.setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({}),
            },
          },
        })
        telescope.load_extension("ui-select")
      end,
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
      pickers = {
        fd = {
          mappings = {
            i = {
              ["<C-d>"] = function() vim.api.nvim_set_current_dir("%s") end
            }
          }
        },
        git_branches = {
          mappings = {
            i = {
              ["<C-d>"] = diff("DiffviewOpen %s"),
            }
          }
        },
        git_bcommits = {
          mappings = {
            i = {
              ["<C-d>"] = diff("Gitsigns diffthis %s"),
            }
          },
        },
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local selection = action_state.get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)
                vim.api.nvim_command('bdelete ' .. selection.bufnr)
              end,
            }
          }
        },
        git_commits = {
          mappings = {
            i = {
              ["<C-d>"] = diff("DiffviewOpen %s"),
            }
          },
        },
        colorscheme = {
          enable_preview = true,
          layout_config = { preview_width = 0.7 },
        },
      }
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")

    -- See `:help telescope.builtin`
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fo", telescope.oldfiles, { desc = "[F]ind recently [O]pened files" })
    vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>rt", telescope.resume, { desc = "[R]esume [T]elescope" })
    vim.keymap.set("n", "<leader>fc", telescope.git_commits, { desc = "[F]ind Git [C]ommits" })
    vim.keymap.set("n", "<leader>fb", telescope.git_branches, { desc = "[F]ind Git [B]ranches" })
    vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fd", telescope.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", telescope.lsp_references, { desc = "[F]ind [R]eferences" })
    vim.keymap.set("n", "<leader>fi", telescope.lsp_implementations, { desc = "[F]ind [I]mplementations" })
    vim.keymap.set("n", "<leader>fk", telescope.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "[F]ind [H]elp tags" })
    vim.keymap.set("n", "<leader>fs", telescope.git_status, { desc = "[F]ind Git [S]tatus" })
    vim.keymap.set("n", "<leader>ch", telescope.command_history, { desc = "[C]ommands [H]istory" })

    vim.keymap.set("n", "<leader>fw", function()
      telescope.live_grep({ default_text = vim.fn.expand("<cword>") })
    end, { noremap = true, desc = "[F]ind [W]ord" })
    vim.keymap.set("n", "<leader>fn", function()
      telescope.find_files({ cwd = "~/.config/nvim" })
    end, { noremap = true, desc = "[F]ind [N]eovim Configuration files" })
    vim.keymap.set("n", "<leader>fP", function()
      telescope.find_files({ no_ignore = true })
    end, { noremap = true, desc = "[F]ind [P]rojects" })
    vim.keymap.set("n", "<leader>fp", function()
      require("telescope.builtin").find_files({
        cwd = "~/Desktop/projects",
        find_command = { "fd", "--type", "d", "--max-depth", "1" },
        attach_mappings = function(_, map)
          map("i", "<C-d>", function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            require("telescope.actions").close(prompt_bufnr)
            vim.schedule(function()
              vim.cmd("cd " .. selection.path)
              print("Changed to directory: " .. selection.path)
            end)
          end)
          return true
        end
      })
    end, { noremap = true, desc = "[F]ind [P]rojects" })
    vim.keymap.set("n", "<leader>fW", function()
      telescope.live_grep({ default_text = vim.fn.expand("<cWORD>") })
    end, { noremap = true, desc = "[F]ind [w]ord" })
    vim.keymap.set("n", "<leader>FW", function()
      telescope.find_files({ default_text = vim.fn.expand("<cWORD>") })
    end, { noremap = true, desc = "[F]ind Files [W]ord" })
  end,
}
