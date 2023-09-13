return {
	-- colorschemes
	{ "navarasu/onedark.nvim", priority = 1000 },
	{ "gruvbox-community/gruvbox", priority = 2 },
	{ "Mofiqul/dracula.nvim", priority = 1 },
	-- delete buffers without closing window layout;
	"moll/vim-bbye",
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		priority = 100,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- i3 config syntax highlighting
	{ "mboughaba/i3config.vim", lazy = true, priority = 1, ft = "i3config" },
	-- formatter
	{ "mhartington/formatter.nvim", priority = 20 },
	-- s-motion to search by 2 characters
	{ "justinmk/vim-sneak", lazy = true, priority = 10, keys = { "S", "s" } },
	-- asynchronous completion framework
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-emoji",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-calc",
	"petertriho/cmp-git",
	-- ripgrep source for completion
	"lukas-reineke/cmp-rg",
	-- npm packages completion
	{
		"David-Kunz/cmp-npm",
		lazy = true,
		priority = 2,
		ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- ui helper for lsp
	"glepnir/lspsaga.nvim",
	{ "j-hui/fidget.nvim", lazy = true, priority = 99, tag = "legacy" },
	-- project manager
	{ "coffebar/project.nvim", dev = false },
	-- search counter
	{ "google/vim-searchindex", lazy = true, priority = 3, keys = { "n", "N", "/" } },
	-- turn off highlighting when you are done searching
	{ "romainl/vim-cool", lazy = true, priority = 4, keys = { "n", "N", "/" } },
	-- automatically save files
	{ "Pocco81/AutoSave.nvim", priority = 40 },
	-- commenter (gc)
	{
		"numToStr/Comment.nvim",
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---Disable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				basic = false,
				extra = false,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
	},
	-- automatically close pairs such as (), {}, ""
	{ "cohama/lexima.vim", priority = 2 },
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- python venv manager
	{ "HallerPatrick/py_lsp.nvim", priority = 2 },
	-- keep visible current function declaration
	"romgrk/nvim-treesitter-context",
	-- nice highlighting for variables
	-- has a binding <a-n> <a-p> to move by matching words
	{ "RRethy/vim-illuminate" },
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm i",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = "markdown",
		lazy = false,
	},
	-- cheatsheet
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
	},
	-- blank char visualization
	{ "lukas-reineke/indent-blankline.nvim", priority = 70 },
	-- show debug info
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
		end,
	},
	-- bufferline - tabs with diagnostics indicator
	{ "akinsho/bufferline.nvim", tag = "v3.7.0", dependencies = { "nvim-tree/nvim-web-devicons" } },
	-- git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"rbong/vim-flog",
	{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	-- snippets
	"rafamadriz/friendly-snippets",
	-- tests
	{
		"klen/nvim-test",
		config = function()
			require("nvim-test").setup({})
		end,
	},
	-- generic way to handle build/run/test/deploy tasks
	{
		"skywind3000/asynctasks.vim",
		-- async terminal task runner
		dependencies = { "skywind3000/asyncrun.vim" },
	},
	-- telescope fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
	-- tree viewer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		priority = 200,
	},
	-- session manager
	{ "Shatur/neovim-session-manager", lazy = false },
	-- wrapper around the Lua code formatter
	{ "ckipp01/stylua-nvim", lazy = true, priority = 3, ft = "lua" },
	-- add or edit surrounding
	{
		"kylechui/nvim-surround",
		lazy = true,
		priority = 130,
		keys = { "cs", "ds", "ys" },
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-surround").setup({})
		end,
	},
	-- tranform Text Case
	{ "johmsalas/text-case.nvim" },
	-- toggle booleans
	{ "nguyenvukhang/nvim-toggler", lazy = true, keys = { "<leader>i" } },
	-- replace in files with regexp
	{ "nvim-pack/nvim-spectre" },
	-- css color visualization
	{ "NvChad/nvim-colorizer.lua" },
	-- auto close tags
	{ "windwp/nvim-ts-autotag" },
	-- dim unused variables and functions using lsp and treesitter
	{
		"coffebar/dim.lua",
		priority = 2,
		dev = false,
		dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	},
	-- color piker
	{
		"coffebar/ccc.nvim",
		branch = "session_switching_fix",
		priority = 1,
		dev = false,
	},
	-- bookmarks
	{ "ThePrimeagen/harpoon" },
	-- copy history
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup({
				enable_macro_history = false,
				keys = {
					telescope = {
						i = {
							select = "<cr>",
							delete = "<c-d>", -- delete an entry
							edit = "<c-e>", -- edit an entry
							custom = {},
						},
					},
					fzf = {},
				},
			})
		end,
	},
	-- github copilot
	"github/copilot.vim",
}

----
-- May be interesting:
-- amarakon/nvim-cmp-fonts
-- axkirillov/easypick.nvim -- easily create Telescope pickers
-- saecki/crates.nvim
-- mg979/vim-visual-multi
-- lukas-reineke/cmp-under-comparator
-- vigoux/ltex-ls.nvim
-- vigoux/notifier.nvim
-- jose-elias-alvarez/null-ls.nvim
-- lifepillar/pgsql.vim
-- ThePrimeagen/vim-be-good -- The Game!
-- akinsho/git-conflict.nvim -- visualise and resolve conflicts
-- klen/nvim-config-local -- secure local config files
-- rcarriga/nvim-notify
-- dmmulroy/tsc.nvim -- project-wide TypeScript type-checking
-- folke/todo-comments.nvim -- show TODOs
-- razak17/tailwind-fold.nvim -- fold long html class attr (class="..")
-- stevearc/dressing.nvim -- UI replacement for default input,select
--
