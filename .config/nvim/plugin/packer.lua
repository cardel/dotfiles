local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return function()
		vim.notify("packer isn't installed", vim.log.levels.ERROR)
	end
end

vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- plugins here

	-- colorschemes
	use("gruvbox-community/gruvbox")
	use("navarasu/onedark.nvim")
	use("Mofiqul/dracula.nvim")

	-- delete buffers without closing window layout;
	use("moll/vim-bbye")

	-- statusline
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
	use("nvim-tree/nvim-web-devicons")
	-- i3 config syntax highlighting
	use("mboughaba/i3config.vim")
	-- formatter
	use("mhartington/formatter.nvim")
	-- s-motion to search by 2 characters
	use("justinmk/vim-sneak")
	-- asynchronous completion framework
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-calc")
	use("petertriho/cmp-git")
	-- ripgrep source for completion
	use("lukas-reineke/cmp-rg")
	-- npm packages completion
	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	-- ui helper for lsp
	use("glepnir/lspsaga.nvim")
	use({ "j-hui/fidget.nvim", tag = "legacy" })
	-- project manager
	use("coffebar/project.nvim")
	-- search counter
	use("google/vim-searchindex")
	-- turn off highlighting when you are done searching
	use("romainl/vim-cool")
	-- automatically save files
	use("Pocco81/auto-save.nvim")
	-- commenter (gc)
	use("numToStr/Comment.nvim")
	-- automatically close pairs such as (), {}, ""
	use("cohama/lexima.vim")
	-- treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	-- :TSPlaygroundToggle will open treesitter preview split
	-- use("nvim-treesitter/playground")

	-- python venv manager
	use("HallerPatrick/py_lsp.nvim")

	-- keep visible current function declaration
	use("romgrk/nvim-treesitter-context")
	-- nice highlighting for variables
	-- has a binding <a-n> <a-p> to move by matching words
	use("RRethy/vim-illuminate")
	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	-- help menu
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	-- blank char visualization
	use("lukas-reineke/indent-blankline.nvim")
	-- UI replacement for default input,select
	-- integrated with telescope
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({})
		end,
	})
	-- show debug info
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	-- bufferline - tabs with diagnostics indicator
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	-- git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("rbong/vim-flog")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	-- snippets
	use("rafamadriz/friendly-snippets")
	-- tests
	use({
		"klen/nvim-test",
		config = function()
			require("nvim-test").setup({})
		end,
	})
	-- generic way to handle build/run/test/deploy tasks
	use({
		"skywind3000/asynctasks.vim",
		-- async terminal task runner
		requires = { "skywind3000/asyncrun.vim" },
	})
	-- telescope fuzzy finder
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	use("nvim-telescope/telescope-file-browser.nvim")
	-- tree viewer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})
	-- session manager
	use("Shatur/neovim-session-manager")
	-- wrapper around the Lua code formatter
	use("ckipp01/stylua-nvim")
	-- add or edit surrounding
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	-- tranform Text Case
	use("johmsalas/text-case.nvim")
	-- toggle booleans
	use("nguyenvukhang/nvim-toggler")
	-- replace in files with regexp
	use("nvim-pack/nvim-spectre")
	-- css color visualization
	use("NvChad/nvim-colorizer.lua")
	-- auto close tags
	use("windwp/nvim-ts-autotag")
	-- dim unused variables and functions using lsp and treesitter
	use({
		"coffebar/dim.lua",
		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	})
	-- color piker
	use({ "coffebar/ccc.nvim", branch = "session_switching_fix" })
	-- bookmarks
	use("ThePrimeagen/harpoon")
	-- yank history
	use({
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
	})
	-- github copilot
	use("github/copilot.vim")

	--
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
	--
end)
