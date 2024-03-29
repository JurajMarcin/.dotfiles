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
HISTSIZE=10000000
SAVEHIST=10000000
bindkey -e
# End of lines configured by zsh-newuser-install

source ~/.zsh/keys.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

function precmd_title {
    printf "\033]0;%s@%s  %s\007" "${USER}" "ntb-jm03" "${PWD/#$HOME/~}"
}

function preexec_title {
    printf "\033]0;%s@%s  %s  %s\007" "${USER}" "ntb-jm03" "${PWD/#$HOME/~}" "$2"
}

precmd_functions=($precmd_functions precmd_title)
preexec_functions=($preexec_functions preexec_title)
