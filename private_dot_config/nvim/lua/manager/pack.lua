-- manager.commands registers the PackChanged build-hook autocmd; must run
-- before vim.pack.add() so the "install" event isn't missed.
require("manager.commands")

vim.pack.add({
	-- @UI
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/shaunsingh/nord.nvim" },
	{ src = "https://github.com/echasnovski/mini.icons" },

	-- @LSP
	-- completions LuaSnip
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },

	-- mason
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- conform formatter
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- snippets
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.5.0" },

	-- @UTILS
	-- Misc
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/catgoose/nvim-colorizer.lua" },
	{ src = "https://github.com/vyfor/cord.nvim" },

	-- Parser
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Search
	-- Oil
	{ src = "https://github.com/stevearc/oil.nvim" },

	-- Telescope
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-frecency.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

	-- Notes
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/f3fora/cmp-spell" },
	{ src = "https://github.com/3rd/image.nvim" },
})

-- @REQUIRES
-- @UI
require("plugins.ui.gitsigns")
require("plugins.ui.lualine")
require("plugins.ui.icons")
require("plugins.ui.nord")

-- @LSP
require("plugins.lsp.engine.mason")
require("plugins.lsp.engine.conform")
require("plugins.lsp.completions.nvim_cmp")

-- @UTILS
-- Misc
require("plugins.utils.misc.autopairs")
require("plugins.utils.misc.colorizer")
require("plugins.utils.misc.discord")

-- Parser
require("plugins.utils.parser.treesitter")

-- Search
require("plugins.utils.search.oil")
require("plugins.utils.search.telescope")

-- Notes
require("plugins.utils.notes.render_markdown")
require("plugins.utils.notes.image")
