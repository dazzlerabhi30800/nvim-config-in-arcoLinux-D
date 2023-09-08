require("persisted").setup({
	save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Resolves to ~/.local/share/nvim/sessions/
	telescope = {
		before_source = function()
			-- Close all open buffers
			-- Thanks to https://github.com/avently
			vim.api.nvim_input("<ESC>:%bd<CR>")
		end,
		after_source = function(session)
			print("Loaded session " .. session.name)
		end,
	},
})
