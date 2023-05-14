local M = {}

function M.setup()
	local navbuddy = require("nvim-navbuddy")

	-- I cooked up this litle autocommand (mostly) all on my own.
	-- For some reason, the attach method described in the README
	-- doesn't work on its own. Probably a dependency conflict.
	-- The LspAttach insight came from :h lsp-config and the
	-- navbuddy.attach came from the navbuddy README. 
	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.documentSymbolProvider then
				navbuddy.attach(client, args.buf)
			end
		end,
	})

	-- from README; doesn't work
	-- require("lspconfig").clangd.setup {
	-- 	on_attach = function(client, bufnr)
	-- 		navbuddy.attach(client, bufnr)
	-- 	end
	-- }
end

return M
