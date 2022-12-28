local M = {}

function M.setup()
	require('nvim-treesitter.configs').setup({
		ensure_installed = { "lua", "typescript", "tsx", "javascript", "go" },
		indent = {
			enable = true
		},
		incremental_selection = {
			enable = true,
			keymaps = {}
		},
		highlight = {
			enable = true
		},
		autotag = {
			enable = true -- relies on windwp/nvim-ts-autotag
		}
	})
end

return M
