return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lang = "rust",
    injector = {
      ["rust"] = {
        before = { "fn main(){}", "struct Solution;" },
      }, ---@type table<lc.lang, lc.inject>
    },
    hooks = {
      ---@type fun(question: lc.ui.Question)[]
      ["question_enter"] = {
        function(question)
          local problem_dir = vim.fn.stdpath("data") .. "/leetcode/Cargo.toml"
          local content = [[
                [package]
                name = "leetcode"
                edition = "2024"

                [lib]
                name = "%s"
                path = "%s"
              ]]

          local file = io.open(problem_dir, "w")
          if file then
            local formatted = (content:gsub(" +", "")):format(question.q.frontend_id, question:path())
            file:write(formatted)
            file:close()
          else
            print("Failed to open file: " .. problem_dir)
          end
        end,
      },
    },
  },
  cmd = { "Leet" },
}
