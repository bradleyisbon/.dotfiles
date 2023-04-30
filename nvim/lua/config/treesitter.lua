local M = {}

function M.setup()
	require('nvim-treesitter.configs').setup({
		ensure_installed = { "lua", "typescript", "tsx", "javascript", "go" },
		indent = {
			enable = true
		},
		incremental_selection = {
			enable = true,
			keymaps = {}
		},
		highlight = {
			enable = true
		},
		autotag = {
			enable = true -- relies on windwp/nvim-ts-autotag
		},
		context_commentstring = {
			enable = true,
			config = {
				javascript = {
					__default = '// %s',
					jsx_element = '{/* %s */}',
					jsx_fragment = '{/* %s */}',
					jsx_attribute = '{/* %s */}',
					comment = '// %s'
				}
			}
		}
	})
end

return M
