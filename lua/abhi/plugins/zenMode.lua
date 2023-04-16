require("zen-mode").toggle({
	window = {
		width = 0.60, -- width will be 85% of the editor width
		options = {
			signcolumn = "no",
		},
	},
	plugins = {
		options = {
			ruler = true,
			showcmd = true,
		},
	},
})
