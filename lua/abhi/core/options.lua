local opt = vim.opt -- for conciseness

--line numbers
--opt.relativenumber = true
opt.number = true

-- tabs & identation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- disable commenting the next line automatically
vim.opt_local.formatoptions:remove({ "r", "o" })
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

--aditional configuration
opt.cmdheight = 1
opt.laststatus = 2

--line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- set cursor to line on insert mode
-- opt.guicursor = "a:block-Cursor/lCursor"
-- opt.guicursor = "n-v-c:block-Cursor/lCursor,i-cr:hor10,r-cr:hor10,o:hor10"
-- opt.guicursor = "n-v-c:block-Cursor/lCursor,i-cr:ver10,r-cr:ver10,o:ver10"
-- opt.guicursor = "n-v-c:blinkon0-Cursor/lCursor,i-cr:block-cursor,r-cr:block-cursor,o:ver20"
--

-- cursor line options
-- vim.o.cursorline = true
-- vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
vim.api.nvim_command("hi CursorLine guifg=NONE guibg=#653328")

-- for configuring the neovide
vim.g.neovide_transparency = 0.9
-- vim.g.neovide_background_color = "#0f1117"
vim.g.neovide_scale_factor = 0.9
vim.g.neovide_refresh_rate = 90
-- vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_floating_blur_amount_x = 10.0
vim.g.neovide_floating_blur_amount_y = 10.0
vim.g.neovide_cursor_trail_size = 0.4
vim.g.neovide_cursor_vfx_opacity = 100.0
-- vim.g.neovide_cursor_animation_length = 0.035
vim.g.neovide_cursor_animation_length = 0.022
vim.g.neovide_scroll_animation_length = 0.2
vim.g.neovide_no_idle = 1

-- for lsp debug
-- vim.lsp.set_log_level("debug")
vim.lsp.set_log_level("off")

-- for not changing cursor in terminal
-- vim.opt.NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

-- Changing the background color
-- vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])

if vim.g.neovide == true then
	-- vim.opt.guifont = { "Hack Nerd Font", ":h12" }
	vim.opt.guifont = { "JetBrainsMono Nerd Font Mono", ":h12" }
	-- opt.guicursor = "n-v-c:block-Cursor/lCursor,i-cr:hor10,r-cr:hor10,o:hor10"
	opt.guicursor = "n-v-c:block-Cursor/lCursor,i-cr:ver12,r-cr:ver12,o:ver12"
	-- opt.guicursor = "n-v-c:block-Cursor/lCursor,i-cr:ver20,r-cr:ver20,o:ver20"
	-- opt.guicursor = "a:block-Cursor/lCursor"
end
