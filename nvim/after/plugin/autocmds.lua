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

-- Set tf files to the filetype terraform
api.nvim_create_autocmd({"BufNewFile","BufRead"}, {
	pattern = {"*.tf"},
	command = "set filetype=terraform"
})

-- Set shiftwidth for typescript
api.nvim_create_autocmd("FileType", {
	pattern = {"typescript", "javascript", "typescriptreact"},
	command = "set shiftwidth=2 expandtab"
})

-- Return to last edit position when opening files - https://stackoverflow.com/a/14449484
api.nvim_create_autocmd("BufReadPost", {
	pattern = {"*"},
	command = "silent! normal! g`\"zv"
})

-- Format on save
api.nvim_create_autocmd("BufWritePost", {
pattern = {"*"},
command = "FormatWrite"
})
