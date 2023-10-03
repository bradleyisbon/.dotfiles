local M = {}

function M.setup() 
	require("toggleterm").setup()
	
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
			vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", {noremap = true, silent = true})
		end,
	})

	function _lazygit_toggle()
		lazygit:toggle()
	end

	function set_tt_keys()
		vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], {buffer = 0})
		vim.keymap.set('t', '<C-space>', [[<C-\><C-n>]], {buffer = 0})
	end

	-- something else must be overwriting the <esc> mapping for terminal mode
	-- because it won't work unless set_tt_keys is called after neovim has loaded;
	-- below is one way of doing that
	vim.cmd('autocmd! TermOpen term://* lua set_tt_keys()')

	local mappings = {
		s = {
			name = "Terminal",
			t = {":ToggleTerm<CR>", "Toggle"},
			a = {":ToggleTermToggleAll<CR>", "Toggle All"},
			n = {function() require("toggleterm.terminal").Terminal:new():toggle() end, "New"},
			s = {":ToggleTerm", "Select #"},
			g = {"<cmd>lua _lazygit_toggle()<cr>", "lazygit"}
		}
	}
	require("which-key").register(mappings, { prefix = "<leader>" })
end


return M
