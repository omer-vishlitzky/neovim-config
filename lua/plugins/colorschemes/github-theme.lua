return {
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      options = {
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = true,
          search = true,
        },
        styles = {
          comments = 'italic',
          keywords = 'bold',
          types = 'italic,bold',
        }
      }
    })
  end
}
