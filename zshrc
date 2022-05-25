# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename "$HOME/.zshrc"

export fpath=(~/.local/share/zsh/site-functions/ $fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/timewarrior/timewarrior.plugin.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

source ~/.zsh/keys.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
