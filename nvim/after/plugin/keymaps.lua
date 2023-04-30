local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local g = vim.g

-- Set <space> as <leader>
-- <Nop> ensures that <Space> isn't mapped to anything
keymap("", "<Space>", "<Nop>", default_opts)
g.mapleader = " "
-- <LocalLeader> is used for mappings which are local to a buffer
g.maplocalleader = " "

keymap("n", "<c-j>", "10j", default_opts)
keymap("n", "<c-k>", "10k", default_opts)
keymap("v", "<c-j>", "10j", default_opts)
keymap("v", "<c-k>", "10k", default_opts)
