-- @OPTIONS

-- leadermap
vim.g.mapleader = " "

-- indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- mode
vim.opt.showmode = false

-- floating windows
vim.o.winborder = "rounded"

-- cursor line
vim.o.cursorline = true

-- relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- scrolling
vim.opt.scrolloff = 999

-- v-block
vim.opt.virtualedit = "block"

-- replace split
vim.opt.inccommand = "split"

-- autoread changes
vim.o.autoread = true

-- cmdline
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"

-- inlay_hint
vim.lsp.inlay_hint.enable(true)

-- undofile/undodir
vim.opt.undofile = true
local undodir = vim.fn.expand("~/.config/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

-- wrapping in normal files
vim.opt.wrap = false
-- spell checker/wrapping in txt/md
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "es", "en" } -- español/english
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})

-- undotree
vim.cmd("packadd nvim.undotree")

-- ui
require("vim._core.ui2").enable({ enable = true })
