return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  keys = {
    { "<leader>f", mode = { "n" } },
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
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")

    -- See `:help telescope.builtin`
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fo", telescope.oldfiles, { desc = "[F]ind recently [O]pened files" })
    vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>rt", telescope.resume, { desc = "[R]esume [T]elescope" })
    vim.keymap.set("n", "<leader>fc", telescope.git_commits, { desc = "[F]ind Git [C]ommits" })
    vim.keymap.set("n", "<leader>fB", telescope.git_branches, { desc = "[F]ind Git [B]ranches" })
    vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fd", telescope.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", telescope.lsp_references, { desc = "[F]ind [R]eferences" })
    vim.keymap.set("n", "<leader>fi", telescope.lsp_implementations, { desc = "[F]ind [I]mplementations" })
    vim.keymap.set("n", "<leader>fk", telescope.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "[F]ind [H]elp tags" })
    vim.keymap.set("n", "<leader>fs", telescope.git_status, { desc = "[F]ind Git [S]tatus" })

    vim.keymap.set("n", "<leader>fw", function()
      require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
    end, { noremap = true, desc = "[F]ind [W]ord" })
    vim.keymap.set("n", "<leader>fW", function()
      require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cWORD>") })
    end, { noremap = true, desc = "[F]ind [w]ord" })
  end,
}
