local M = {}


function M.setup()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local null_ls = require('null-ls')
	null_ls.setup {
		sources = {
			-- null_ls.builtins.formatting.prettier
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						-- vim.lsp.buf.format()
						-- print('formatted!')
					end,
				})
			end
		end,
	}
end

return M
