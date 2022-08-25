local M = {}

function M.setup()
	local npairs = require "nvim-autopairs"
	local Rule = require "nvim-autopairs.rule"
	npairs.setup {
		check_ts = true,
	}

	-- Add end tag to lua function declarations
	npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")

	-- Add closing space inside parentheses
	-- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules
	npairs.add_rules {
		Rule(' ', ' ')
			:with_pair(
				function (opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({ '()', '[]', '{}' }, pair)
				end)
	}
end

return M
