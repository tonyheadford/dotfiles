plugin_path:=${HOME}/.vim/pack/plugins/start

all: homebrew link vim_plugins git

link:
	stow -v --stow home

git: link
	git config --global core.excludesfile ${HOME}/.gitignore_global

vim_plugins: link
	mkdir -p ${plugin_path}
	git -C ${plugin_path} clone https://github.com/tpope/vim-commentary.git
	git -C ${plugin_path} clone https://github.com/tpope/vim-fugitive.git
	git -C ${plugin_path} clone https://github.com/tpope/vim-rails.git
	git -C ${plugin_path} clone https://github.com/tpope/vim-surround.git
	git -C ${plugin_path} clone https://github.com/tpope/vim-vinegar.git
	git -C ${plugin_path} clone https://github.com/thoughtbot/vim-rspec.git
	git -C ${plugin_path} clone https://github.com/junegunn/fzf.vim.git

homebrew:
	brew install openssl@1.1 readline stow
	brew install rbenv ruby-build fzf fnm tig

clean: clean_vim unlink

clean_vim:
	rm -rf ${plugin_path}/*

unlink:
	stow -v --delete home
