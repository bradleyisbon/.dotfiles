local M = {}

function M.setup()
	local has_words_before = function()
		-- 
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
	end

	local luasnip = require "luasnip"
	local cmp = require "cmp"

	-- docs are sparse; use :h {option} to learn more about below options
	cmp.setup {
		completion = { completeopt = "menu,menuone,noinsert,noselect", keyword_length = 1 },
		experimental = { native_menu = false, ghost_text = false },
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			format = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					luasnip = "[Snip]",
					nvim_lua = "[Lua]",
					treesitter = "[Treesitter]"
				})[entry.source.name]
				return vim_item
			end,
		},
		mapping = {
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
			["<CR>"] = cmp.mapping {
				i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
				c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
			},
			["<Tab>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end,
				{ "i", "s", "c" }
			),
			["<S-Tab>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s", "c" }
			)
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "treesitter" },
			{ name = "buffer" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "path" },
		},
		window = {documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
		}},
	}

	-- Use buffer source for "/"
	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ";"
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path" }
		}, {
			{ name = "cmdline" }
		}),
	})


end

return M
