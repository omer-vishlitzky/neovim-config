-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {
  },
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

require('github-theme').setup({
  options = {
      inverse = {                -- Inverse highlight for different types
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

require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
	--- @usage 'moon'|'moon'|'dawn'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
	}
})

vim.cmd("colorscheme gruvbox")


math.randomseed(os.time())

-- Function to generate a random number between 1 and 5
function _G.ChangeColorScheme()
    local randomNumber = math.random(1, 5)
    if randomNumber == 1 then
	vim.cmd("colorscheme gruvbox")
    elseif randomNumber == 2 then
	vim.cmd("colorscheme rose-pine")
    elseif randomNumber == 3 then
	vim.cmd("colorscheme github_dark")
    elseif randomNumber == 4 then
	vim.cmd("colorscheme github_dark_tritanopia")
    elseif randomNumber == 5 then
	vim.cmd("colorscheme darcula-solid")
    else
	vim.cmd("colorscheme torte")
    end
end
vim.api.nvim_command('command! ChangeColorScheme lua ChangeColorScheme()')
vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>ChangeColorScheme<CR>', { desc = "[Change Color"})


function GetCurrentColorscheme()
    return vim.g.colors_name
end

