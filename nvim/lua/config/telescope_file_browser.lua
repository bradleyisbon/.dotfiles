local M = {}

function M.setup()
	-- -- You don't need to set any of these options.
	-- -- IMPORTANT!: this is only a showcase of how you can set default options!
	require("telescope").setup {
	  extensions = {
	    file_browser = {
		grouped = true,
	    },
	  },
	}
	-- To get telescope-file-browser loaded and working with telescope,
	-- you need to call load_extension, somewhere after setup function:
	require("telescope").load_extension "file_browser"

	local whichkey = require("which-key")

	local opts = {
		prefix = "<leader>"
	}

	-- local mappings = {
	-- 	f = {
	-- 		f = {"<cmd>Telescope file_browser<cr>", "Find Files"},
	-- 	}
	-- }
	--
	-- whichkey.register(mappings, opts)
end

return M
