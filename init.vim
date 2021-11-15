call plug#begin('~/.config/nvim/plugged')
" use neomake for code checking
Plug 'neomake/neomake'
" use vim-commentary to comment stuff out
Plug 'tpope/vim-commentary'
" use nvim-gdb as the best of all bad debuggers
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
" use auto-pairs to insert and delete pairs of brackets, parens, and quotes
Plug 'jiangmiao/auto-pairs'
" launch and initialize language servers
Plug 'neovim/nvim-lspconfig'
" use nvim-cmp for autocompletion
Plug 'hrsh7th/nvim-cmp'
" i believe hrsh7th/nvim-cmp uses hrsh7th/cmp-nvim-lsp to talk to the LSP.
" whatever it does, it makes completions work
Plug 'hrsh7th/cmp-nvim-lsp'
" used for signature hover - doesn't work with neovim 0.5.1
Plug 'glepnir/lspsaga.nvim'
" maximizes/demaximizes selected window
Plug 'szw/vim-maximizer'
" file explorer
Plug 'scrooloose/nerdtree'
" <Leader> s quick motions
Plug 'easymotion/vim-easymotion'
" Add parens and other surrounding punctuation
Plug 'tpope/vim-surround'
" Git interface
Plug 'tpope/vim-fugitive'
" Highlight last yank
Plug 'machakann/vim-highlightedyank'
" Code highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Fixes python indents
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" from https://github.com/hrsh7th/nvim-cmp readme
set completeopt=menu,menuone,noselect

lua << EOF
require'lspconfig'.pyright.setup{}

-- copied from :h lsp:
-- i_CTRL-X_CTRL-O will provide completions from the language server
-- Use LSP as the handler for omnifunc.
--    See `:help omnifunc` and `:help ins-completion` for more information.
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
      end,
    },
    mapping = {
	['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    },
  })

-- for syntax highlighting
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
  }

-- python debugger
require('dap-python').setup('~/Envs/debugpy/bin/python')
EOF

nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" Press K to hover in normal mode
nnoremap <silent> <C-K> <cmd>lua vim.lsp.buf.hover()<CR>
inoremap <silent> <C-K> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> mm :MaximizerToggle<CR>

" from :help dap-mappings
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

" show function signature on hover
autocmd CursorHoldI * silent!       :Lspsaga signature_help

"show relative line numbers by default
set rnu

" use pylint as neomake linter
" let g:neomake_python_enabled_makers = ['pylint']
"
" use flake8 as neomake linter - faster than pylint
let g:neomake_python_enabled_makers = ['flake8']

" auto code check using neomake
call neomake#configure#automake('nrwi', 500)

require('nvim-autopairs').setup{}

"let g:python3_host_prog = '/Users/bradi/.pyenv/versions/3.8.11/bin/python'

" use <leader>nf to open current file in NERDtree explorer
nmap <leader>nf :NERDTreeFind<CR>

" use <C-k> and <C-b> to toggle NERDtree explorer
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>

" open NERDtree explorer on launch
augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree
augroup END

" show hidden files by default in NERDtree
let g:NERDTreeShowHidden=1

let g:vimspector_enable_mappings = 'HUMAN'

" use <F14> to insert if name main thing
:inoremap <silent> <F14> if __name__ == '__main__':<return>

" map control-c to clear last search highlights
nnoremap <nowait><silent> <C-C> :noh<CR>

" set tabs for html to 4 spaces
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=4 shiftwidth=4 softtabstop=4

" single tab after line break inside parens
let g:pyindent_open_paren = 'shiftwidth()'

" Return to last edit position when opening files - https://stackoverflow.com/a/14449484
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
