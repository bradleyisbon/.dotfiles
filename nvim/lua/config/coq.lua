local M = {}

function M.setup()
	local coq = require "coq"
	coq.Now() -- Start coq

	-- 3rd party sources
	require "coq_3p" {
		{ src = "nvimlua", short_name = "nLUA", conf_only = false }, -- Lua
		{ src = "bc", short_name = "MATH", precision = 6 }, -- Calculator
		{ src = "figlet", trigger = "!big" }, -- draw big banners by ending comments with !big
		{ src = "cow", trigger = "!cow" }, -- draws cows by ending comments with !cow
		{
			src = "repl",
			sh = "zsh",
			shell = { p = "perl", n = "node" },
			max_lines = 99,
			deadlines = 500,
			unsafe = { "rm", "poweroff", "mv" },
		},
	}
end

return M
