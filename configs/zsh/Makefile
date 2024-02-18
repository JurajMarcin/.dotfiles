.PHONY: ALL SERVER WORKSTATION CLEAN

ALL:

WORKSTATION: SERVER
	git -C ~/.config/zsh/timewarrior pull || git clone https://github.com/svenXY/timewarrior.git ~/.config/zsh/timewarrior

SERVER:
	../../scripts/install zsh ~/.config/zsh
	../../scripts/install zshrc ~/.zshrc
	../../scripts/install zshenv ~/.zshenv
	./setup-host-color.sh

CLEAN:
	$(RM) -r ~/.config/zsh
	$(RM) ~/.zshrc
	$(RM) ~/.zshenv
