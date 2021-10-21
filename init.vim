call plug#begin('~/.config/nvim/plugged')
" use neomake for code checking
Plug 'neomake/neomake'
" use vim-commentary to comment stuff out
Plug 'tpope/vim-commentary'
" use nvim-gdb as the best of all bad debuggers
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
" use auto-pairs to insert and delete pairs of brackets, parens, and quotes
Plug 'jiangmiao/auto-pairs'
" launch and initialize language servers
Plug 'neovim/nvim-lspconfig'
" use nvim-cmp for autocompletion
Plug 'hrsh7th/nvim-cmp'
" i believe hrsh7th/nvim-cmp uses hrsh7th/cmp-nvim-lsp to talk to the LSP.
" whatever it does, it makes completions work
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
    }
  })

-- for syntax highlighting
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
  }
EOF

nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" Press K to hover in normal mode
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

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

let g:vimspector_enable_mappings = 'HUMAN'

" use <F14> to insert if name main thing
:inoremap <silent> <F14> if __name__ == '__main__':<return>

" map control-c to clear last search highlights
nnoremap <nowait><silent> <C-C> :noh<CR>

" set tabs for html to 4 spaces
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=4 shiftwidth=4 softtabstop=4

" single tab after line break inside parens
let g:pyindent_open_paren = 'shiftwidth()'

