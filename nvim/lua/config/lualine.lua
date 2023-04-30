local M = {}

function M.setup()
	require('lualine').setup({
		options = {
			theme = 'solarized_dark'
		}
	})
end

return M
