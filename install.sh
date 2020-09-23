#!/bin/bash

# link files
# for f in *
# do
	# SRC="${PWD}/${f}"
	# DST="${HOME}/.${f}"

	# if [ -f $DST ]; then
		# echo "backing up existing ${DST}"
		# mv $DST "${DST}.bak"
	# fi
	# echo "creating link to ${DST}"
	# ln -s $SRC $DST
# done

# install vim plugins
echo "installing vim plugins"
PLUGINS=( "tpope/vim-bundler" \
          "tpope/vim-fugitive" \
          "tpope/vim-markdown" \
          "tpope/vim-projectionist" \
          "tpope/vim-rails" \
          "tpope/vim-rake" \
          "tpope/vim-surround" \
          "tpope/vim-vinegar" \
          "kien/ctrlp.vim" \
          "tomtom/tcomment_vim" \
          "kchmck/vim-coffee-script" )

for p in "${PLUGINS[@]}"
do
  git clone https://github.com/${p}.git $HOME/.vim/bundle/$(basename "${p}")
done

# install gitignore
echo "adding global gitignore"
git config --global core.excludesfile $HOME/.gitignore_global

