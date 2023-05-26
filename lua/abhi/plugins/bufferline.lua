local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "slant",
		-- separator_style = { "", "" },
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
	},
	highlights = {
		separator = {
			-- fg = "#073642",
			-- bg = "#002b36",
			fg = "#373535",
			bg = "#1D1D1D",
		},
		-- 	separator_selected = {
		-- 		-- fg = "#073642",
		-- 		fg = "#080808",
		-- 	},
		-- 	background = {
		-- 		fg = "#657b83",
		-- 		bg = "#002b36",
		-- 	},
		-- 	buffer_selected = {
		-- 		fg = "#fdf6e3",
		-- 		bold = true,
		-- 	},
		-- 	fill = {
		-- 		-- bg = "#073642",
		-- 		-- bg = "#1e1e1e",
		-- 		bg = "#080808",
		-- 	},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
