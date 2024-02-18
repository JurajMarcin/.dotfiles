.PHONY: ALL SERVER WORKSTATION CLEAN

ALL:

WORKSTATION:
	m4 -DUSE_PLUGINS=y init.vim.in > init.vim
	../../scripts/install init.vim ~/.config/nvim/init.vim
	./install-vim-plug.sh
	nvim +PlugInstall +PlugClean! +PlugUpgrade +PlugUpdate +qa
	$(RM) init.vim
	mkdir -p ~/.config/nvim/spell
	curl -o ~/.config/nvim/spell/cs.utf-8.spl https://ftp.sh.cvut.cz/pub/vim/runtime/spell/cs.utf-8.spl
	curl -o ~/.config/nvim/spell/sk.utf-8.spl https://ftp.sh.cvut.cz/pub/vim/runtime/spell/sk.utf-8.spl

SERVER:
	m4 init.vim.in > init.vim
	../../scripts/install init.vim ~/.config/nvim/init.vim
	$(RM) init.vim

CLEAN:
	$(RM) -r ~/.config/nvim
