local nmap = function(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- @GENERIC SHORTCUTS
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")
nmap("<leader>y", "<cmd> %y+ <CR>", "copy all file")

-- @SEARCH
local builtin = require("telescope.builtin")

-- Telescope Files
nmap("<C-p>", builtin.find_files, "search files in current file directory")
nmap("<C-o>", builtin.oldfiles, "find old visited files")

-- Telescope Strings
nmap("<C-l>", builtin.live_grep, "grep files in current file directory")

-- Telescope History
nmap("<C-c>", builtin.command_history, "command history")
nmap("<C-s>", builtin.search_history, "search history")

-- Telescope Diagnostics
nmap("<C-d>", builtin.diagnostics, "find LSP diagnostics in current visited files")

-- Telescope Git
nmap("<leader>gs", builtin.git_status, "git status")
nmap("<leader>gc", builtin.git_commits, "git commits (log)")
nmap("<leader>gb", builtin.git_branches, "change between branches")

-- Oil
nmap("<C-{>", "<cmd>Oil<CR>", "file explorer")
nmap("-", "<cmd> Oil --float<CR>", "floating window file explorer")

-- @LSP
nmap("K", vim.lsp.buf.hover, "see hover under cursor")
nmap("<leader>re", vim.lsp.buf.rename, "rename string under cursor")
nmap("<leader>gd", vim.lsp.buf.definition, "go to definition under cursor")
nmap("gr", vim.lsp.buf.references, "see references under cursor")
nmap("<leader>ca", vim.lsp.buf.code_action, "see code actions under cursor")
nmap("<leader>gf", function() -- format
	require("conform").format({ lsp_format = "fallback" })
end, "format current file if possible")

-- LSP Manager
nmap("<C-k>", "<cmd>Mason<CR>", "LSP manager")

-- @DIAGNOSTICS
nmap("<leader>e", vim.diagnostic.open_float, "see current LSP diagnostic under cursor in floating window")
nmap("<leader>q", vim.diagnostic.setloclist, "see LSP diagnostics in current file")
nmap("<leader>h", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, "toggle diagnostics in current file")

-- @TERMINAL
-- vim Builtin Terminal
nmap("<leader>t", function()
	vim.cmd.vsplit()
	vim.api.nvim_win_set_width(0, 40)
	vim.cmd.term()
	vim.cmd.startinsert()
end, "toggle terminal in right vsplit")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true }) -- vim modes in Terminal

-- @VSPLIT
nmap("<leader>vs", "<cmd>vsplit<CR>", "right vsplit")

-- @UNDOTREE
nmap("<leader>u", require("undotree").open, "open undotree")
