local M = {}

function M.setup()
	require('formatter').setup {
		filetype = {
			yaml = {
				require('formatter.filetypes.yaml').prettier
			}
		}
	}
end

return M
