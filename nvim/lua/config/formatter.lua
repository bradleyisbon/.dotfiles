local M = {}

function M.setup()
	require('formatter').setup {
		filetype = {
			yaml = {
				require('formatter.filetypes.yaml').prettier
			},
			go = {
				require('formatter.filetypes.go').gofmt
			},
			typescript = {
				require('formatter.filetypes.typescript').prettierd
			},
			typescriptreact = {
				require('formatter.filetypes.typescriptreact').prettierd
			},
		}
	}
end

return M
