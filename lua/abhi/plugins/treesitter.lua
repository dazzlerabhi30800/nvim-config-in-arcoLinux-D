-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

require("nvim-treesitter.install").compilers = { "clang", "gcc", "cmake", "rust" }

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		disable = {},
	},
	-- enable indentation
	indent = { enable = true, disable = {} },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"scss",
		"regex",
	},
	-- auto install above language parsers
	auto_install = true,
	-- autopairs = {
	-- 	enable = true,
	-- },
	autotag = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
