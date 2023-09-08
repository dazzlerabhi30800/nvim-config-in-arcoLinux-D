-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

-- Debouncing autocompletion

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	-- performance = {
	-- 	debounce = 150,
	-- 	trigger_debounce_time = 150,
	-- 	throttle = 100,
	-- 	fetching_timeout = 400,
	-- },

	completion = {
		completeopt = "menu,menuone,noinsert",
		keyword_length = 20,
		debounce = 150,
		group_index = 1,
		max_item_count = 30,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			keyword_length = 20,
			group_index = 1,
			max_item_count = 30,
		}, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})

vim.o.lazyredraw = false -- or
vim.cmd([[ set nolazyredraw ]])

-- vim.cmd([[
-- let g:UltiSnipsEditSplit="vertical"
-- let g:UltiSnipsSnippetDirectories=["~/snippets/ultisnips"]
-- autocmd BufWritePost *.snippets :CmpUltisnipsReloadSnippets
-- ]])
--
-- vim.o.lazyredraw = false
-- vim.cmd([[set nolazyredraw]])
-- vim.o.ttyfast = true
