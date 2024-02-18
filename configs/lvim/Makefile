.PHONY: ALL SERVER WORKSTATION CLEAN

ALL:

WORKSTATION:
	../../scripts/install config.lua ~/.config/lvim/config.lua
	../../scripts/install after ~/.config/lvim/after
	mkdir -p ~/.config/lvim/spell
	curl -o ~/.config/lvim/spell/cs.utf-8.spl https://ftp.sh.cvut.cz/pub/vim/runtime/spell/cs.utf-8.spl
	curl -o ~/.config/lvim/spell/sk.utf-8.spl https://ftp.sh.cvut.cz/pub/vim/runtime/spell/sk.utf-8.spl

SERVER:

CLEAN:
	$(RM) -r ~/.config/lvim/config.lua
	$(RM) -r ~/.config/lvim/after
	$(RM) -r ~/.config/lvim/spell
