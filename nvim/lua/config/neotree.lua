local M = {}

function M.setup()
	require("neo-tree").setup({
		window = {
			mappings = {
				["o"] = "open",
				["T"] = "toggle_node",
				["<space>"] = false
			}
		},
		filesystem = {
			find_by_full_path_words = true,
			filtered_items = {hide_dotfiles = false},
			follow_current_file = {enabled = true}
		},
	})
end

return M
