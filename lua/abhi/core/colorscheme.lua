vim.cmd("colorscheme oxocarbon")

local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
if not status then
	print("Colorscheme not found")
end
