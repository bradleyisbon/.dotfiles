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
	  { "<leader>a", ":wa<CR>", desc = "Write All" },
	  { "<leader>c", ":q<CR>", desc = "Close" },
	  { "<leader>d", group = "Force" },
	  { "<leader>dc", ":q!<CR>", desc = "Close Window" },
	  { "<leader>dq", ":qa!<CR>", desc = "Quit All" },
	  { "<leader>h", "<C-w>h", desc = "Window Left" },
	  { "<leader>j", "<C-w>j", desc = "Window Down" },
	  { "<leader>k", "<C-w>k", desc = "Window Up" },
	  { "<leader>l", "<C-w>l", desc = "Window Right" },
	  { "<leader>q", ":qa<CR>", desc = "Quit All" },
	  { "<leader>t", group = "Toggle" },
	  { "<leader>th", ":set hlsearch!<CR>", desc = "Highlights" },
	  { "<leader>tl", ":set nu! rnu!<CR>", desc = "Number Lines" },
	  { "<leader>tt", ":Neotree toggle<CR>", desc = "File Tree" },
	  { "<leader>w", ":w<CR>", desc = "Write" },
	  { "<leader>x", ":noh<CR>", desc = "Clear Highlights" },
	  }

	whichkey.setup(conf)
	whichkey.add(mappings)

end

return M
