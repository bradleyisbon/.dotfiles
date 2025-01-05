local M = {}


function register_mappings()
	local opts = {
		prefix = "<C-w>"
	}

	function pick_window()
		vim.fn.win_gotoid(windowpicker.pick_window())
		print(" ")
	end

local mappings = 
  {
  { "<C-w>p", pick_window, desc = "Pick Window" },
  }
	-- local mappings = {
	-- 	p = {
	-- 		pick_window, "Pick Window"
	-- 	}
	-- }

	require('which-key').add(mappings)
end

function M.setup()
	local windowpicker = require('window-picker')

	windowpicker.setup({
		filter_rules = {
			bo = {
				-- removing default 'terminal'
				buftype = {},
			},
		},
		-- highlights = {
		-- 	statusline = {
		-- 		focused = {
		-- 			fg = '#FFA500',
		-- 			bg = '#FFA500',
		-- 			bold = true,
		-- 		},
		-- 		unfocused = {
		-- 			fg = '#FFA500',
		-- 			bg = '#FFA500',
		-- 			bold = true,
		-- 		},
		-- 	},
		-- },
	})

	register_mappings()
end

return M
