local M = {}

function M.setup()
	local whichkey = require("which-key")

	local opts = {
		prefix = "<leader>"
	}

	local mappings = {
		f = {
			name = "Telescope",
			f = {"<cmd>Telescope find_files<cr>", "Find Files"},
			g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
			l = {"<cmd>Telescope find_files<cr>", "Find Files"},
			b = {"<cmd>Telescope buffers<cr>", "Buffers"},
			f = {"<cmd>Telescope find_files<cr>", "Find Files"},
			g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
			h = {"<cmd>Telescope help_tags<cr>", "Help Tags"},
			j = {"<cmd>Telescope jumplist<cr>", "Jump List"},
			m = {"<cmd>Telescope marks", "Marks"},
			r = {"<cmd>Telescope lsp_references<cr>", "Find References"},
			s = {"<cmd>Telescope grep_string<cr>", "Find String"},
			d = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
			f = {"<cmd>Telescope find_files<cr>", "Find Files"},
		}
	}

	whichkey.register(mappings, opts)

end

return M
