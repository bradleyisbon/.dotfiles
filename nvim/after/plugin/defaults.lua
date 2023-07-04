local opt = vim.opt

opt.number = true -- Enable absolute line number
opt.relativenumber = true -- Enable relative line numbers
opt.clipboard = "unnamedplus" -- Use the system clipboard
opt.termguicolors = true -- Add more colors to terminal
opt.timeoutlen = 200 -- Time in milliseconds to wait for a mapped sequence to complete
opt.so = 999

vim.cmd[[colorscheme bluloco]]
