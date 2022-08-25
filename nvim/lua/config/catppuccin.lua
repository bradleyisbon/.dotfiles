local M = {}

function M.setup()
	vim.g.catppuccin_flavor = "macchiato"

	require("catppuccin").setup({
		dim_inactive = {
			enabled = true,
		},
		integrations = { 
			neotree = {
				enabled = true,
			},
		}
	})

	vim.cmd [[colorscheme catppuccin]]
end

return M
