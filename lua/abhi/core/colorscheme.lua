vim.cmd("colorscheme palenightfall")

local status, _ = pcall(vim.cmd, "colorscheme palenightfall")
if not status then
	print("Colorscheme not found")
end
