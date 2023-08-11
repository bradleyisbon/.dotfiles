local M = {}

function M.setup()
	-- Will only be set to truthy value when packer is first installed
	local packer_bootstrap = false

	local function packer_init()
		local fn = vim.fn

		-- evaluates to ~/.local/share/nvim unless $XDG_DATA_HOME points somewhere else
		local data_path = fn.stdpath("data")
		-- set the install_path to the packpath; h: packpath for more info
		local install_path = data_path .. "/site/pack/packer/start/packer.nvim"

		-- if nothing is installed to the install path
		-- then clone the packer repo 
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path
			}
			vim.cmd [[packadd packer.nvim]]
		end

		-- Run PackerSync if there are changes in this file
		vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerSync"
	end

	-- Plugins
	local function plugins(use)
		use { "wbthomason/packer.nvim" }
		if packer_bootstrap then
			print("Neovim restart required after packer installation.")
			require("packer").sync()
		end

		use { 
			"nvim-treesitter/nvim-treesitter",
			commit = "d3ca4de",
			run = ':TSUpdate',
			setup = function()
			end,
			config = function()
				require('config.treesitter').setup()
			end,
		}

		use {
			"windwp/nvim-autopairs",
			config = function()
				require("config.autopairs").setup()
			end,
		}
		
		use {
			'numToStr/Comment.nvim',
			config = function()
				require('Comment').setup()
			end
		}

		use {
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup()
			end,
		}

		use {
			'lewis6991/gitsigns.nvim',
			config = function()
				require("config.gitsigns").setup()
			end
		}

		use {
			-- uses fd as fuzzy finder; `brew install fd` to install on mac
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x", -- ensure no breaking changes
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- requires a patched font from www.nerdfonts.com
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("config.neotree").setup()
			end,
		}

		use {
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
		}

		use { 
			"williamboman/mason.nvim",
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"ray-x/lsp_signature.nvim",
				{
					"hrsh7th/cmp-nvim-lsp",
					commit = "affe808",
				},
			}
		}
		use {
			"williamboman/mason-lspconfig.nvim",
		}

		use {
			"neovim/nvim-lspconfig",
		}

		-- use {
		-- 	"neovim/nvim-lspconfig",
		-- 	opt = true,  -- set as optional; load on event below
		-- 	event = "BufReadPre",  -- load plugin on this event
		-- 	-- wants is undocumented packer keyword; seems to give warning on load if wants plugin not installed
		-- 	wants = {
		-- 		"cmp-nvim-lsp",
		-- 		"nvim-lsp-installer",
		-- 		"lsp_signature.nvim"
		-- 	}, 
		-- 	config = function()
		-- 		require("config.lsp").setup()
		-- 	end,
		-- 	requires = {
		-- 		"williamboman/nvim-lsp-installer",
		-- 		"ray-x/lsp_signature.nvim",
		-- 	}
		-- }
		--

		use {
			"hrsh7th/nvim-cmp",
			commit = '99ef854322d0de9269044ee197b6c9ca14911d96',
			event = "InsertEnter", -- load on entering insert mode
			opt = true,
			config = function()
				require("config.cmp").setup()
			end,
			wants = {  "LuaSnip", },
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				{
					"hrsh7th/cmp-nvim-lsp",
					commit = "affe808"
				},
				"ray-x/cmp-treesitter",
				"saadparwaiz1/cmp_luasnip",
				{
					"L3MON4D3/LuaSnip",
					config = function()
						require("config.luasnip").setup()
					end,
				},
			},
			disable = false,
		}

		use {
			'folke/tokyonight.nvim',
			config = function()
				require("config.tokyonight").setup()
			end
		}

		use {
			"akinsho/toggleterm.nvim",
			tag = 'v2.*',
			config = function()
				print('toggleterm config')
				require("config.toggleterm").setup()
			end
		}

		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} },
			config = function()
				require("config.telescope").setup()
			end
		}

		-- use {
		-- 	'jose-elias-alvarez/null-ls.nvim',
		-- 	commit = '07d4ed4c6b561914aafd787453a685598bec510f',
		-- 	config = function()
		-- 		require("config.null_ls").setup()
		-- 	end
		-- }

		use {
			'Tsuzat/NeoSolarized.nvim',
			config = function()
				require("config.neosolarized").setup()
			end
		}

		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require("config.lualine").setup()
			end
		}

		use {
			"nvim-telescope/telescope-file-browser.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require("config.telescope_file_browser").setup()
			end
		}

		use {
			"SmiteshP/nvim-navbuddy",
			requires = {
				"neovim/nvim-lspconfig",
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
				"numToStr/Comment.nvim",        -- Optional
				"nvim-telescope/telescope.nvim" -- Optional
			},
			config = function()
				require("config.navbuddy").setup()
			end,
		}

		use {
			'uloco/bluloco.nvim',
			requires = { 'rktjmp/lush.nvim' }
		}
	end

	packer_init()
	
	-- packer.vim configuration
	local conf = {
		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end
		}
	}

	local packer = require("packer")
	packer.init(conf)
	packer.startup(plugins)
end

return M
