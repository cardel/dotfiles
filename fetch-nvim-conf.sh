#!/bin/bash
if grep Ubuntu /etc/os-release; then
	echo "Ubuntu is not supported for now. Reason: snap version has broken tree-sitter, apt version is too old for tree-sitter"
	exit 1
	# sudo apt install -y git rsync npm ripgrep neovim
	# sudo snap install go --classic
	# git clone --depth 1 https://github.com/wbthomason/packer.nvim \
	# 	~/.local/share/nvim/site/pack/packer/start/packer.nvim
else
	yay --version || exit 1
	echo "Using yay to install required packages"
	# packages from arch repo
	PKG=(autopep8 neovim go npm rust-analyzer lua-language-server fd ripgrep xclip rsync python-virtualenv)
	# packages from AUR
	PKG_AUR=(ltex-ls-bin nvim-packer-git)
	# chech all packages if installed
	# to avoid asking for sudo if nothing will be installed
	TO_INSTALL=()
	for pn in "${PKG[@]}"; do
		yay -Q | grep "$pn " || TO_INSTALL+=("$pn")
	done
	for pn in "${PKG_AUR[@]}"; do
		yay -Qm | grep "$pn " || TO_INSTALL+=("$pn")
	done
	# install all at once
	[ "${#TO_INSTALL[@]}" -eq 0 ] || yay -Sy --noconfirm --needed "${TO_INSTALL[@]}"
fi

mkdir -p ~/.config/nvim
mkdir -p ~/.node_modules/lib/node_modules

git clone --depth=1 https://github.com/coffebar/dotfiles.git /tmp/dotfiles_tmp_nvim
rsync -rv --delete /tmp/dotfiles_tmp_nvim/.config/nvim/ ~/.config/nvim/
[ -f ~/.prettierrc.json ] && mv ~/.prettierrc.json ~/.prettierrc.json.bak && echo "~/.prettierrc.json replaced"
mv /tmp/dotfiles_tmp_nvim/.prettierrc.json ~/.prettierrc.json
rm -rf /tmp/dotfiles_tmp_nvim/

npm config set prefix ~/.node_modules
# install pnpm for better performance and disk space usage
npm install -g pnpm

# set pnpm home env variable
export PNPM_HOME=~/.local/share/pnpm

# if pnpm is not in PATH, add it
if ! command -v pnpm > /dev/null; then
	export PATH="$PATH:$HOME/.local/share/pnpm:$HOME/.node_modules/bin"
fi

_INSTALLED=$(pnpm list -g)
function install_packages_if_needed() {
	# install packages if not installed
	for p in "$@"; do
		echo "$_INSTALLED" | grep -F "$p " > /dev/null || pnpm install -g "$p"
	done
}

install_packages_if_needed pyright bash-language-server \
	vscode-langservers-extracted \
	prettier prettier-plugin-ssh-config \
	prettier-plugin-sh \
	prettier-plugin-nginx @prettier/plugin-php \
	typescript typescript-language-server \
	stylefmt intelephense \
	eslint @johnnymorganz/stylua-bin \
	@shufo/prettier-plugin-blade \
	emmet-ls

go version && go install golang.org/x/tools/gopls@latest

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > /dev/null 2>&1
