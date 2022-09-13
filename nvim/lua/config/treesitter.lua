local M = {}

function M.setup()
	require('nvim-treesitter.configs').setup({
		ensure_installed = { "lua", "typescript", "tsx" },
		indent = {
			enable = true
		},
		incremental_selection = {
			enable = true,
			keymaps = {}
		},
		highlight = {
			enable = true -- treesitter won't work on first file opened if enabled
		}
	})
end

return M
