local M = {}

function M.setup()
	require("gitsigns").setup {
		current_line_blame = true
	}

	local whichkey = require("which-key")

	local opts = {
		prefix = "<leader>"
	}

	local mappings = {
		t = {
			name = "Toggle",
			b = {":Gitsigns toggle_current_line_blame<cr>", "Git Blame"}
		},
	}

	whichkey.register(mappings, opts)

	opts = {
		prefix = "g"
	}

	mappings = {
		h = {":Gitsigns next_hunk<cr>", "Next Hunk"},
		H = {":Gitsigns prev_hunk<cr>", "Prev Hunk"}
	}

	whichkey.register(mappings, opts)
end

return M


