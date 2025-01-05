local M = {}

local servers = {
	gopls = {},
	html = {},
	jsonls = {},
	pyright = {},
	sumneko_lua = {},
	tsserver = {},
	rust_analyzer = {}
}

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Disable formatting - I'll use null-ls for that - https://stackoverflow.com/a/71671597
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more info
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Configure key mappings
	require("config.lsp.keymaps").setup(client, bufnr)

	-- Show line diagnostics in hover window
	vim.o.updatetime = 250 -- time to hold before CursorHold is fired
	vim.diagnostic.config({
		virtual_text = false -- disable line diagnostic
	})
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
end

local lsp_signature = require("lsp_signature")
lsp_signature.setup {
	bind = true,
	handler_opts = {
		border = "rounded"
	}
}

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local options = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

function M.setup()
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
			require("lspconfig")[server_name].setup(opts)
		end
	})
end

return M
