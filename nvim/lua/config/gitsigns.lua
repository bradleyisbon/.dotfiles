local M = {}

function M.setup()
	require("gitsigns").setup {
		current_line_blame = true
	}

	-- local whichkey = require("which-key")
	--
	-- local mappings = 
	--   {
	--   { "<leader>t", group = "Toggle" },
	--   { "<leader>tb", ":Gitsigns toggle_current_line_blame<cr>", desc = "Git Blame" },
	--   }
	-- whichkey.add(mappings)
	--
	-- mappings = 
	--   {
	--   { "gH", ":Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
	--   { "gh", ":Gitsigns next_hunk<cr>", desc = "Next Hunk" },
	--   }
	-- whichkey.add(mappings)
end

return M


