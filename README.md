![Screenshot](/screenshot.png)

<div align="center">

![](https://img.shields.io/github/last-commit/coffebar/dotfiles?style=flat-square&logo=)
![](https://img.shields.io/github/stars/coffebar/dotfiles?style=flat-square&logo=)
[![](https://img.shields.io/github/repo-size/coffebar/dotfiles?style=flat-square&logo=)](https://github.com/iamverysimp1e/dots)

</div>

# dotfiles backup

## Overview


- [🌿 Window Managers / Compositors](https://github.com/coffebar/dotfiles#overview):
  - [🍚 Hyprland](https://github.com/hyprwm/Hyprland)
  - [🍙 i3](https://i3wm.org/) as fallback
- [👽 Terminal](https://github.com/coffebar/dotfiles#overview):
  - :robot: Emulator: [Alacritty](https://alacritty.org/) with [*JetBrains Mono*](https://www.jetbrains.com/lp/mono/) font (use Nerd Fonts)
  - [🌌 Shell](https://github.com/coffebar/dotfiles#overview): Zsh with [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh) and `robbyrussell` theme
- [✏️ Editors](https://github.com/coffebar/dotfiles#overview):
  - [:green_heart: neovim](https://neovim.io/) :green_heart:
  - 🦍 obsidian
- [:art: Themes](https://github.com/coffebar/dotfiles#overview):
  - :desktop_computer: [Arc-Dark](https://github.com/horst3180/arc-theme) GTK theme
  - :basecamp: [bloom-classic](https://github.com/linuxdeepin/deepin-icon-theme) Icons and bloom cursor (from deepin)
  - :new_moon_with_face: Telegram theme: [ArcDarkGrey](https://t.me/addtheme/arcdarkgrey)
  - :robot: Terminal colors: mix of the OneDark, Arc-Dark and PopOS
  - :green_heart: Neovim: 
	 - [onedark](https://github.com/navarasu/onedark.nvim) with background color from Arc-Dark 
	 - [gruvbox](https://github.com/gruvbox-community/gruvbox) - only in TTY

- [:pushpin: Bars](https://github.com/coffebar/dotfiles#overview):
  - :womans_hat: [waybar](https://github.com/Alexays/Waybar) on Hyprland
  - :tophat: [polybar](https://github.com/polybar/polybar) on i3
- [:brain: Task manager](https://github.com/coffebar/dotfiles#overview):
  - [:bookmark_tabs: Taskwarrior-tui](https://github.com/kdheepak/taskwarrior-tui) dark themed and configured as floating modal


<details><summary><h2>Interesting features</h2></summary>

#### Common for Window managers

- ``Alt + f`` opens a file manager in the directory found in the clipboard. For example, if you copied a file from some program, you can open its directory by pressing this shortcut.

- Mouse side buttons bound to copy and paste in graphics applications. Although I try to use the mouse less, it's useful for (web)apps with mouse-centric UI.

- CapsLock's behavior is changed to Backspace.

- I'm not using Display Managers (no LightDM or GDM).

- ``Ctrl + m`` bind simplifies sequence ``Ctrl + l, Ctrl + v, Return`` to interact with file-picker dialog by selecting file from clipboard blazingly fast.

- ``Super + P`` pull dotfiles from this repo and shows a notification with an icon.

- Notifications when the battery level is low or fully charged.

- ``Alt + Space`` close a focused window.

- Partially different config for each machine depending on hostname.

- ``Super + ` `` open ssh servers menu to connect.

#### i3

- UI scale options depend on the current display setup and [autorandr](https://github.com/phillipberndt/autorandr) profile name.

- ``Super + \ `` open fuzzy finder to search for local text files in the home directory to edit in Neovim.

- Automatic tiling via [autotiling](https://github.com/nwg-piotr/autotiling) script. Split direction depends on the currently focused window dimensions.

- Some of wm's binds were improved by Lua script. Lua has more flexibility than i3config syntax. I like to switch automatically to the appropriate workspace after opening programs using a keyboard shortcut.

- Automatic tiling freed up ``Super + H`` shortcut. So I'm using HJKL to navigate inside WM.

#### Terminal

- ``Alt + e`` execute suggested command from zsh-autosuggestions

- ``Ctrl + x`` after typing `# comment question` provides OpenAI generated suggestion

- ``Command + c`` ``Command + v`` copy & paste. `Ctrl + c` and `Ctrl + p` in neovim.

- Neovim [opens](https://github.com/coffebar/dotfiles/blob/master/.config/nvim/lua/coffebar/commands.lua) popular image formats in the external viewer ([pix](https://github.com/linuxmint/pix)) instead of binary view. Neovim also has a bunch of customizations and keyboard shortcuts.

- Nice aliases: **i** to install package, **md2pdf** to convert markdown file to pdf, **v** to open Neovim, **yy** to perform system upgrade. 

- Custom pacman hook updates the list of explicitly installed packages (pkglist-intel.txt) when install or remove something.


#### Neovim project management

https://github.com/coffebar/neovim-project/assets/3100053/c83ae8ab-625e-4a44-88e1-7d7e61c4bad8

📦 [neovim-project](https://github.com/coffebar/neovim-project) plugin

</details>

<details><summary><h2>Neovim plugins full list</h2></summary>

<!-- plugins list start -->
- [0oAstro/dim.lua](https://github.com/0oAstro/dim.lua)  Dim unused words in neovim
- [AckslD/nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)  Clipboard manager neovim plugin with telescope integration
- [HallerPatrick/py_lsp.nvim](https://github.com/HallerPatrick/py_lsp.nvim)  Lsp Plugin for working with Python virtual environments
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)  Snippet Engine for Neovim written in Lua.
- [Mofiqul/dracula.nvim](https://github.com/Mofiqul/dracula.nvim)  Dracula colorscheme for neovim written in Lua
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)  UI Component Library for Neovim.
- [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)  Maintained fork of the fastest Neovim colorizer
- [Pocco81/AutoSave.nvim](https://github.com/Pocco81/AutoSave.nvim)  🧶 Automatically save your changes in NeoVim
- [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)  illuminate.vim - (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
- [Shatur/neovim-session-manager](https://github.com/Shatur/neovim-session-manager)  A simple wrapper around :mksession.
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) ThePrimeagen/harpoon
- [ckipp01/stylua-nvim](https://github.com/ckipp01/stylua-nvim)  Let&#39;s just use a formatter and never discuss formatting again.
- [coffebar/ccc.nvim](https://github.com/coffebar/ccc.nvim)  Super powerful color picker / colorizer plugin.
- [coffebar/neovim-project](https://github.com/coffebar/neovim-project)  Neovim project manager maintains your recent project history and uses Telescope to select from autosaved sessions.
- [cohama/lexima.vim](https://github.com/cohama/lexima.vim)  Auto close parentheses and repeat by dot dot dot...
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)  🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)  💥   Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
- [github/copilot.vim](https://github.com/github/copilot.vim)  Neovim plugin for GitHub Copilot
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)  improve neovim lsp experience
- [google/vim-searchindex](https://github.com/google/vim-searchindex)  vim-searchindex: display number of search matches &amp; index of a current match
- [gruvbox-community/gruvbox](https://github.com/gruvbox-community/gruvbox)  Retro groove color scheme for Vim - community maintained edition
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)  nvim-cmp source for buffer words
- [hrsh7th/cmp-calc](https://github.com/hrsh7th/cmp-calc)  nvim-cmp source for math calculation
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)  nvim-cmp source for vim&#39;s cmdline
- [hrsh7th/cmp-emoji](https://github.com/hrsh7th/cmp-emoji)  nvim-cmp source for emoji
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)  nvim-cmp source for neovim builtin LSP client
- [hrsh7th/cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)  cmp-nvim-lsp-signature-help
- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)  nvim-cmp source for nvim lua
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)  nvim-cmp source for path
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  A completion plugin for neovim coded in Lua.
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)  markdown preview plugin for (neo)vim
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)  Standalone UI for nvim-lsp progress
- [johmsalas/text-case.nvim](https://github.com/johmsalas/text-case.nvim)  An all in one plugin for converting text case in Neovim
- [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)  The missing motion for Vim :athletic_shoe:
- [klen/nvim-test](https://github.com/klen/nvim-test)  A Neovim wrapper for running tests
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)  Add/change/delete surrounding delimiter pairs with ease. Written with in Lua.
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)  Git integration for buffers
- [lukas-reineke/cmp-rg](https://github.com/lukas-reineke/cmp-rg)  ripgrep source for nvim-cmp
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)  Indent guides  for Neovim
- [mboughaba/i3config.vim](https://github.com/mboughaba/i3config.vim)  Vim syntax highlighting for i3 config :point_left:
- [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim) mhartington/formatter.nvim
- [moll/vim-bbye](https://github.com/moll/vim-bbye)  Delete buffers and close files in Vim without closing your windows or messing up your layout. Like Bclose.vim, but rewritten and well maintained.
- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)  One dark and light colorscheme for neovim &gt;= 0.5.0 written in lua based on Atom&#39;s One Dark and Light theme. Additionally, it comes with 5 color variant styles
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)  Quickstart configs for Nvim LSP
- [nguyenvukhang/nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)  invert text in vim, purely with lua.
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)  :brain: // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)  plenary: full; complete; entire; absolute; unqualified. All the lua functions I don&#39;t want to write twice.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)  A blazing fast and easy to configure neovim statusline plugin written in pure lua.
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)  Neovim plugin to manage the file system and other tree like structures.
- [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre)  Find the enemy and replace them with dark power.
- [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)  File Browser extension for telescope.nvim
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  Find, Filter, Preview, Pick. All lua, all the time.
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)  lua `fork` of vim-web-devicons for neovim
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)  Nvim Treesitter configurations and abstraction layer
- [petertriho/cmp-git](https://github.com/petertriho/cmp-git)  Git source for nvim-cmp
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)  Set of preconfigured snippets for different languages.
- [rbong/vim-flog](https://github.com/rbong/vim-flog)  A fast, beautiful, and powerful git branch viewer for vim.
- [romainl/vim-cool](https://github.com/romainl/vim-cool)  A very simple plugin that makes hlsearch more useful.
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)  The neovim tabline plugin.
- [romgrk/nvim-treesitter-context](https://github.com/romgrk/nvim-treesitter-context)  Show code context
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)  luasnip completion source for nvim-cmp
- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)  Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
- [skywind3000/asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)  :rocket: Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!
- [skywind3000/asynctasks.vim](https://github.com/skywind3000/asynctasks.vim)  :rocket: Modern Task System for Project Building, Testing and Deploying !!
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)  fugitive.vim: A Git wrapper so awesome, it should be illegal
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)  Use treesitter to auto close and auto rename html tag
<!-- plugins list end -->

</details>


<details><summary><h2>Preview Neovim setup in Docker</h2></summary>

Full Neovim setup can be tested inside docker container.

```bash
git clone https://github.com/coffebar/docker-test-fetch-nvim-conf.git
cd docker-test-fetch-nvim-conf && sh ./build.sh
```

See [docker-test-fetch-nvim-conf](https://github.com/coffebar/docker-test-fetch-nvim-conf) repo for more details.

</details>


<details><summary>
<h2>Restore backup</h2>
</summary>


### Please don't do this without understanding all files and commands! 

**This instruction will work as is for coffebar only!**

Before proceeding you need to restore SSH and GPG keys.

SSH config must point to the GitHub's private key.

[Review source](https://github.com/coffebar/dotfiles/blob/master/dotfiles-restore.sh)

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/coffebar/dotfiles/master/dotfiles-restore.sh)"
```

### Neovim plugins and dependencies
Run this script to sync Neovim config from this repo. It can be used separately on Arch systems.

It will overwrite the entire `~/.config/nvim` folder and `~/.prettierrc.json` file.

This script requires Arch Linux with **yay** and **sudo** installed. It will install required packages, **pnpm** package manager and node modules for LSP & formatting.

[Review source](https://github.com/coffebar/dotfiles/blob/master/fetch-nvim-conf.sh)

```bash
# export PATH="$PATH:$HOME/.local/share/pnpm:$HOME/.node_modules/bin"
sh -c "$(wget -O- https://raw.githubusercontent.com/coffebar/dotfiles/master/fetch-nvim-conf.sh)"
```
</details>
