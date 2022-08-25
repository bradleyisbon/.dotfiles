local M = {}

function M.setup()
	require("lspsaga").init_lsp_saga {
		server_filetype_map = {
			typescript = 'typescript'
		}
	}
end

return M
