vim.cmd("colorscheme kat.nvim")

local status, _ = pcall(vim.cmd, "colorscheme kat.nvim")
if not status then
	print("Colorscheme not found")
end
