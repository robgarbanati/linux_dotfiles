SHELL := /bin/bash

#corepackages=xclip 
corepackages=build-essential cmake cscope exuberant-ctags curl python3-dev python3-venv
#corepackages=build-essential cmake neovim cscope exuberant-ctags python3.9-dev python3.9-distutils python3.8-dev curl

neovim: install-pip
	sudo snap install --beta nvim --classic
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
	-./create_nvimrc.sh


symlinks:
	-./create_nvimrc.sh

packages:
	for i in $(corepackages) ; do \
		echo installing $$i ; \
		sudo apt install $$i -y ; \
	done

get-pip:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

get-pip2:
	curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip2.py

install-pip: deno
	python3 get-pip.py
	echo 'export PATH=~/.local/bin/:${PATH}' >> ~/.bashrc
	# source ~/.bashrc
	# pip --version

install-pip3.9:
	python3.9 get-pip.py
	# echo 'export PATH=~/.local/bin/:$PATH' >> ~/.bashrc
	# source ~/.bashrc
	# pip --version

