local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	"*",
})

colorizer.setup({
	"css",
	"scss",
	"javascript",
	html = { mode = "background" },
}, { mode = "foreground" })

colorizer.setup({
	"*", -- Highlight all files, but customize some others.
	css = { rgb_fn = true, hsl_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
	md = { hsl_fn = true },
})

colorizer.setup({ "*" }, {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = false, -- "Name" codes like Blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
})
