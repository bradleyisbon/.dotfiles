local api = vim.api

-- Open file tree when directory is opened
StdInReadPre = false
api.nvim_create_autocmd("StdinReadPre", {callback = function() StdInReadPre=false end})
api.nvim_create_autocmd("VimEnter", {callback = function() if vim.fn.argc() == 0 and not StdInReadPre then vim.api.nvim_command('Neotree') end end})

-- Highight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank{higroup="IncSearch", timeout=700}
	end
})
