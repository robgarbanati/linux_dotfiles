SHELL := /bin/bash

#corepackages=build-essential cmake git xclip python3-dev
corepackages=build-essential cmake neovim cscope exuberant-ctags python3.9-dev python3.9-distutils python3.8-dev curl
#corepackages=python3-dev build-essential cmake neovim cscope exuberant-ctags

all: packages ycm

neovim:
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
	-./create_nvimrc.sh

ycm:
# run VundleInstall first
	python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

symlinks:
	-./create_nvimrc.sh

setup_ros_kinetic:
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
	sudo apt-get update
	sudo apt-get install ros-kinetic-desktop-full
	sudo rosdep init
	rosdep update
	echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
	source ~/.bashrc
	sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
	sudo aptitude install ros-kinetic-ros-tutorials -y

packages:
	for i in $(corepackages) ; do \
		echo installing $$i ; \
		sudo apt install $$i -y ; \
	done

packages_old:
	sudo apt-get install aptitude -y
	for i in $(corepackages) ; do \
		echo installing $$i ; \
		sudo aptitude install $$i -y ; \
	done

get-pip:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

install-pip:
	python3.9 get-pip.py
	echo 'export PATH=~/.local/bin/:$PATH' >> ~/.bashrc
	source ~/.bashrc
	pip --version

.PHONY: help
help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
