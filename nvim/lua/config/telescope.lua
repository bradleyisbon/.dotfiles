local M = {}

function M.setup()
	local whichkey = require("which-key")

	local opts = {
		prefix = "<leader>"
	}

	local mappings = {
		f = {
			name = "Telescope",
			l = {"<cmd>Telescope find_files<cr>", "Find Files"},
			g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
			b = {"<cmd>Telescope buffers<cr>", "Buffers"},
			h = {"<cmd>Telescope help_tags<cr>", "Help Tags"},
		}
	}

	whichkey.register(mappings, opts)

end

return M
