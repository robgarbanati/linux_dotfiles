corepackages=build-essential CMake python3-pip git tmux vim xclip fonts-inconsolata

all: packages pip ensure_symlinks ## Make it all!

setup_xterm: ## Symlink files to where they belong
	# link config files here to actual environment.
	./ensure_symlinks.sh
	# set up colors and other configurations for uxterm.
	xrdb -merge ~/.Xresources
	# make uxterm default terminal
	gsettings set org.gnome.desktop.default-applications.terminal exec 'uxterm'
	# Change bash 256 color colorscheme to base16.
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

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
