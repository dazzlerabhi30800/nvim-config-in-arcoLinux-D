local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	"nvim-lua/plenary.nvim", -- lua functions that many plugins

	-- file explorer
	"nvim-tree/nvim-tree.lua",

	"bluz71/vim-nightfly-guicolors",
	{
		"svrana/neosolarized.nvim",
		dependencies = { "tjdevries/colorbuddy.nvim" },
	},

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation

	"szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	{ "numToStr/Comment.nvim", dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	} },
	-- ("terrortylor/nvim-comment")
	-- for better comment plugin
	"Djancyp/better-comments.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"lvimuser/lsp-inlayhints.nvim",

	-- vs-code like icons
	"kyazdani42/nvim-web-devicons",

	-- statusline
	"nvim-lualine/lualine.nvim",
	-- "datwaft/bubbly.nvim",

	-- fuzzy finding w/ telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-file-browser.nvim",

	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim",

	-- configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	-- ({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
	},
	-- ({ "kkharji/lspsaga.nvim" })
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting and linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	-- ("mhartington/formatter.nvim")

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},

	-- auto tag
	-- auto closing
	"windwp/nvim-autopairs",

	-- for emmet
	{
		"mattn/emmet-vim",
		config = function()
			vim.g.user_emmet_jsx = 1
			vim.g.user_emmet_settings = {
				indent_blockelement = 1,
				javascript = {
					extends = "jsx",
				},
			}
		end,
	},

	-- for colorizer
	"norcalli/nvim-colorizer.lua",

	-- Lua
	"ellisonleao/gruvbox.nvim",
	-- catppuccin theme
	{ "catppuccin/nvim", name = "catppuccin" },
	-- Material Theme
	{ "marko-cerovac/material.nvim" },
	-- Palenight Theme
	{
		"JoosepAlviste/palenightfall.nvim",
	},

	--for zoom in neovide
	-- "drzel/vim-gui-zoom",
	-- "dhruvasagar/vim-zoom",
	"navarasu/onedark.nvim",
	-- ("folke/lazy.nvim")
	"Shatur/neovim-ayu",
	"folke/tokyonight.nvim",
	--vs code theme
	"Mofiqul/vscode.nvim",

	--for tabs bufferline
	"akinsho/nvim-bufferline.lua",

	-- vs code theme
	-- "nyoom-engineering/oxocarbon.nvim",
	"B4mbus/oxocarbon-lua.nvim",
	-- { "katawful/kat.nvim", tag = "3.1" },

	-- noice nvim
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		-- "rcarriga/nvim-notify",
	-- 	},
	-- },

	"navarasu/onedark.nvim",

	-- for startup screen
	{
		"goolord/alpha-nvim",
	},
	-- code folding
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
