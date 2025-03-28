---@diagnostic disable: missing-fields
return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    ---@type TSConfig
    local cfg = {
      ensure_installed = {
        "dart",
        "java",
        "json",
        "kotlin",
        "latex",
        "bash",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "c",
        "lua",
        "rust",
        "markdown",
        "markdown_inline",
        "go",
        "yaml",
        "toml",
        "sql",
      },
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
            ["]p"] = "@parameter.outer",
            ["]l"] = "@loop.outer",
            ["]i"] = "@conditional.outer",
            ["]s"] = "@statement.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
            ["]P"] = "@parameter.outer",
            ["]L"] = "@loop.outer",
            ["]I"] = "@conditional.outer",
            ["]S"] = "@statement.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
            ["[p"] = "@parameter.outer",
            ["[l"] = "@loop.outer",
            ["[i"] = "@conditional.outer",
            ["[s"] = "@statement.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
            ["[P"] = "@parameter.outer",
            ["[L"] = "@loop.outer",
            ["[I"] = "@conditional.outer",
            ["[S"] = "@statement.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sp"] = "@parameter.inner",
            ["<leader>sf"] = "@function.outer",
            ["<leader>sl"] = "@loop.outer",
            ["<leader>sb"] = "@block.outer",
            ["<leader>ss"] = "@statement.outer",
          },
          swap_previous = {
            ["<leader>sP"] = "@parameter.inner",
            ["<leader>sF"] = "@function.outer",
            ["<leader>sL"] = "@loop.outer",
            ["<leader>sB"] = "@block.outer",
            ["<leader>sS"] = "@statement.outer",
          },
        },
        lsp_interop = {
          enable = true,
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
            ["<leader>dp"] = "@parameter.outer",
            ["<leader>dc"] = "@call.outer",
          },
        },
      }
    }
    require("nvim-treesitter.configs").setup(cfg)
  end,
}
