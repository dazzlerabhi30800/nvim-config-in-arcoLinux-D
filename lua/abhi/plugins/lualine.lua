local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local colors = {
	blue = "#b5fc6d",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#63AcfD",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.grey },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = "none" },
		b = { fg = colors.white, bg = "none" },
		c = { fg = colors.white, bg = "none" },
	},
}

vim.bubbly_palette = {
	background = "none",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		-- component_separators = "",
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		component_separators = "|",
		-- section_separators = { left = "", right = "" },
	},
	sections = {
		-- lualine_a = { "mode", { "buffers" } },
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				--require("noice").api.statusline.mode.get,
				--cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {
			{
				function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.api.nvim_buf_get_option(buf, "modified") then
							return "eol" -- any message or icon
						end
					end
					return ""
				end,
			},
		},
	},
	tabline = {},
	extensions = { "fugitive" },
})
