SHELL := /bin/bash

corepackages=build-essential cmake git tmux xclip exuberant-ctags python-dev python-pip python3-dev python3-pip
neovim_packages= software-properties-common python-software-properties

all: packages pip ensure_symlinks ## Make it all!

setup_neovim:
	for i in $(neovim_packages) ; do \
		echo installing $$i ; \
		sudo aptitude install $$i -y ; \
	done
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo aptitude install neovim
	sudo aptitude install python-neovim
	sudo aptitude install python3-neovim

setup_ycm:
	pip3 install --upgrade pip
	pip3 install neovim
	python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

setup_vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

symlinks:
	./ensure_symlinks.sh

setup_xterm: ## Symlink files to where they belong
	# link config files here to actual environment.
	./ensure_symlinks.sh
	# Make sure default terminal is gnome-terminal.
	gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'
	# Change xterm shell 256 color colorscheme to base16.
	if [ ! -d ~/.config/base16-shell ]; then \
		git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell ; \
	fi
	# Change gnome-terminal 256 color colorscheme to base16.
	if [ ! -d ~/.config/base16-gnome-terminal ]; then \
		git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal ; \
	fi
	source ~/.config/base16-gnome-terminal/base16-default.dark.sh
	gconftool-2 --set --type string /apps/gnome-terminal/global/default_profile base-16-default-dark

pip: ## Update packages in requirements.in
	sudo aptitude build-dep python3-matplotlib -y
	sudo pip3 install -r requirements.in --upgrade
	sudo pip3 freeze -r requirements.in > requirements.txt

remake-pip: ## Ensure only pip packages in requirements.in are installed
	sudo aptitude build-dep python3-matplotlib -y
	sudo pip3 freeze | xargs sudo pip3 uninstall -y
	sudo pip3 install -r requirements.in --upgrade
	sudo pip3 freeze -r requirements.in > requirements.txt

packages:
	sudo apt-get install aptitude -y
	for i in $(corepackages) ; do \
		echo installing $$i ; \
		sudo aptitude install $$i -y ; \
	done

.PHONY: help
help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
