#!/usr/bin/env bash

mkdir -p ~/.config/nvim
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim
ln -s $(pwd)/cscope_maps.vim ~/.config/nvim/cscope_maps.vim
