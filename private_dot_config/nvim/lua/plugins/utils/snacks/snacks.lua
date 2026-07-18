require("snacks").setup({
	indent = {
		enabled = true,
		filter = function(buf, _)
			return vim.g.snacks_indent ~= false
				and vim.b[buf].snacks_indent ~= false
				and vim.bo[buf].buftype == ""
				and vim.bo[buf].filetype ~= "text"
		end,
	},

	scroll = { enabled = true },

	--quickfile = { enabled = true },
	--input = { enabled = true },
	--notifier = { enabled = true },
	--scope = { enabled = true },
	--statuscolumn = { enabled = true },
	--words = { enabled = true },
})
