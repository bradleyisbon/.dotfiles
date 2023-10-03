local M = {}

function M.setup()
	require('lualine').setup({
		sections = {
			lualine_c = {
				{
					'filename',
					path = 1
				}
			}
		}
	})
end

return M
