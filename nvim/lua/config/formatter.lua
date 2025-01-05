local M = {}

function M.setup()
	require('formatter').setup {
		filetype = {
			-- removing temporarily because yaml bad
			-- yaml = {
			-- 	require('formatter.filetypes.yaml').prettier
			-- }
		}
	}
end

return M
