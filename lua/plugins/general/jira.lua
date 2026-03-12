return {
  "letieu/jira.nvim",
  config = function()
    require("jira").setup({
      jira = {
        base = "https://issues.redhat.com", -- Base URL of your Jira instance
        email = "ovishlit@redhat.com",
        token = os.getenv("JIRA_TOKEN"),
        type = "pat",
        limit = 500, -- Global limit of tasks per view
      },
      queries = {
        ["My open issues"] = "assignee = rh-ee-ovishlit AND resolution = Unresolved AND status not in (Verified) order by updated DESC",
      }
    })
  end,
  lazy = false,
}
