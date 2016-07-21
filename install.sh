#!/bin/bash

# link files
for f in *
do
	SRC="${PWD}/${f}"
	DST="${HOME}/.${f}"

	if [ -f $DST ]; then
		echo "backing up existing ${DST}"
		mv $DST "${DST}.bak"
	fi
	echo "creating link to ${DST}"
	ln -s $SRC $DST
done

# install vundle
echo "installing vundle"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# install gitignore
echo "adding global gitignore"
git config --global core.excludesfile $HOME/.gitignore_global


