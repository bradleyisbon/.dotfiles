local M = {}


function register_mappings()
	local opts = {
		prefix = "<C-w>"
	}

	local mappings = {
		p = {
			pick_window, "Pick Window"
		}
	}

	require('which-key').register(mappings, opts)
end

function M.setup()
	local windowpicker = require('window-picker')
	function pick_window()
		vim.fn.win_gotoid(windowpicker.pick_window())
		print(" ")
	end

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
