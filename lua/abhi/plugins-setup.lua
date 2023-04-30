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
		config = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	-- auto tag
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		lazy = true,
		-- event = "VeryLazy",
	},

	-- auto closing
	{
		"windwp/nvim-autopairs",
	}, -- autoclose parens, brackets, quotes, etc...

	-- for emmet
	"mattn/emmet-vim",

	-- for colorizer
	"norcalli/nvim-colorizer.lua",

	-- Lua
	"ellisonleao/gruvbox.nvim",
	-- catppuccin theme
	{ "catppuccin/nvim", name = "catppuccin" },

	--for zoom in neovide
	"drzel/vim-gui-zoom",
	"navarasu/onedark.nvim",
	-- ("folke/lazy.nvim")
	"Shatur/neovim-ayu",
	"folke/tokyonight.nvim",

	--for tabs bufferline
	"akinsho/nvim-bufferline.lua",

	-- vs code theme
	"martinsione/darkplus.nvim",
	"nyoom-engineering/oxocarbon.nvim",

	-- for startup screen
	{
		"goolord/alpha-nvim",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
