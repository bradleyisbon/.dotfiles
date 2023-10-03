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
		d = {
			name = "Force",
			c = { ":q!<CR>", "Close Window" },
			q = { ":qa!<CR>", "Quit All" }
		},
		q = {":qa<CR>", "Quit All"},
		c = {":q<CR>", "Close"},
		x = {":noh<CR>", "Clear Highlights"},
		h = {"<C-w>h", "Window Left"},
		j = {"<C-w>j", "Window Down"},
		k = {"<C-w>k", "Window Up"},
		l = {"<C-w>l", "Window Right"},
		w = {":w<CR>", "Write"},
		a = {":wa<CR>", "Write All"},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)

end

return M
