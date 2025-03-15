local M = {}

function M.setup()
	-- local whichkey = require("which-key")
	--
	-- local mappings = {
	--   { "<leader>f", group = "Telescope" },
	--   { "<leader>fa", "<cmd>Telescope<cr>", desc = "All Pickers" },
	--   { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	--   { "<leader>fd", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
	--   { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	--   { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	--   { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
	--   { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
	--   { "<leader>fl", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	--   { "<leader>fm", "<cmd>Telescope marks", desc = "Marks" },
	--   { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Find References" },
	--   { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find String" },
	--   }
	--
	-- whichkey.add(mappings)

	require("telescope").setup {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		-- <C-h> opens whichkey from telescope to show the existing mappings
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				}
			}
		}
	}
end

return M
