local M = {}

function M.setup()
	local whichkey = require("which-key")

	local conf = {
		window = {
			border = "single",
			position = "bottom"
		},
	}

	local opts = {
		prefix = "<leader>"
	}

	local mappings = {
		t = {
			name = "Toggle",
			l = {":set nu! rnu!<CR>", "Number Lines"},
			t = {":Neotree toggle<CR>", "File Tree"},
			h = {":set hlsearch!<CR>", "Highlights"},
		},
		f = {
			name = "Force",
			c = { ":q!<CR>", "Close Window" },
			q = { ":qa!<CR>", "Quit All" }
		},
		q = {":qa<CR>", "Quit All"},
		c = {":q<CR>", "Close"}
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)

end

return M
