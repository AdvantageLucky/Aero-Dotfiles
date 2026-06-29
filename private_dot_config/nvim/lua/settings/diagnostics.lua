-- @Langs: @Diagnostics

vim.diagnostic.config({
	signs = {
		numhl = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" }, -- line
		text = { " ", " ", "󰋼 ", "󰌶" }, -- sign column
		texthl = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" }, -- text highlighting
	},

	float = {
		source = true,
		border = "rounded",
	},

	underline = true,
	virtual_text = true,
	severity_sort = true,
	update_in_insert = true,
})
