#!/usr/bin/env bash

IGNORED_FILES=(
  $0
  sources.list
  Makefile
  requirements.in
  requirements.txt
  bashrc
  README.md
)

for file in *
do
  if ! [[ "${IGNORED_FILES[@]}" =~ ${file} || "${IGNORED_FILES[${#IGNORED_FILES[@]}-1]}" == "${file}" ]]; then
    link_from=$(pwd)/$file
    link_to=~/.$file
    if [[ "$file" == "flake8" ]]; then
      link_to=~/.config/flake8
    elif [[ "$file" == "sshconfig" ]]; then
      link_to=~/.ssh/config
    elif [[ "$file" == "vimrc" ]]; then
      link_to=~/.config/nvim/init.vim
    fi

    if [ ! -L $link_to ]; then
      echo "Linking $link_from to $link_to..."
      ln -s "$link_from" "$link_to"
    fi
  fi
done
