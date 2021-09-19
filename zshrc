# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/juraj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

source ~/.zsh/keys.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh

# Update GPG TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Initialize Node Version manager
source /usr/share/nvm/init-nvm.sh
