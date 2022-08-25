local M = {}

function M.setup()
	require("neo-tree").setup({
		window = {
			mappings = {
				["o"] = "open"
			}
		},
		filesystem = {
			find_by_full_path_words = true
		},
	})
end

return M
