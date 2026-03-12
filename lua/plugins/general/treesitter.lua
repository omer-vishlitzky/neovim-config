return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
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
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          if vim.bo[ev.buf].buftype ~= "" then return end
          pcall(vim.treesitter.start, ev.buf)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      local sel_maps = {
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
      }
      for key, query in pairs(sel_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "Select " .. query })
      end

      local next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["]p"] = "@parameter.outer",
        ["]l"] = "@loop.outer",
        ["]i"] = "@conditional.outer",
        ["]s"] = "@statement.outer",
      }
      for key, query in pairs(next_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_start(query, "textobjects")
        end, { desc = "Next " .. query .. " start" })
      end

      local next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
        ["]P"] = "@parameter.outer",
        ["]L"] = "@loop.outer",
        ["]I"] = "@conditional.outer",
        ["]S"] = "@statement.outer",
      }
      for key, query in pairs(next_end) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_end(query, "textobjects")
        end, { desc = "Next " .. query .. " end" })
      end

      local prev_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
        ["[p"] = "@parameter.outer",
        ["[l"] = "@loop.outer",
        ["[i"] = "@conditional.outer",
        ["[s"] = "@statement.outer",
      }
      for key, query in pairs(prev_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_start(query, "textobjects")
        end, { desc = "Prev " .. query .. " start" })
      end

      local prev_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
        ["[P"] = "@parameter.outer",
        ["[L"] = "@loop.outer",
        ["[I"] = "@conditional.outer",
        ["[S"] = "@statement.outer",
      }
      for key, query in pairs(prev_end) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_end(query, "textobjects")
        end, { desc = "Prev " .. query .. " end" })
      end

      vim.keymap.set("n", "<leader>sp", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "[S]wap [P]arameter next" })
      vim.keymap.set("n", "<leader>sP", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "[S]wap [P]arameter prev" })
    end,
  },
}
