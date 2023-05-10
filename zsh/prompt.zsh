autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '✚'
zstyle ':vcs_info:*' unstagedstr '●'
zstyle ':vcs_info:*' formats " %b %c %u"
zstyle ':vcs_info:*' actionformats " %b (%a) %c %u"

DEFAULT_COLOR=${HOST_COLOR:-green}
if [ $(id -u) = "0" ]; then
    USER_COLOR="red"
else
    USER_COLOR=$DEFAULT_COLOR
fi

function prompt_start {
    echo -n "%K{$1}%F{$2} $3 %F{$1}"
}

function prompt_segment {
    echo -n "%K{$1}\ue0b0%F{$2} $3 %F{$1}"
}

function prompt_end {
    echo -n "%k\ue0b0%f%b "
}

function prompt_build {
    prompt_start ${DEFAULT_COLOR} black "%n@%M"
    prompt_segment blue black "%~"
    echo -n "%(?..$(prompt_segment red black "%?"))"
    echo -n "%1(j.$(prompt_segment yellow black "%j").)"
    [[ -n ${vcs_info_msg_0_} ]] && prompt_segment cyan black "$vcs_info_msg_0_"
    [[ -n ${VIRTUAL_ENV} ]] && prompt_segment white black "󰌠  $(basename "$VIRTUAL_ENV")"
    prompt_end
    echo
    prompt_start ${USER_COLOR} black "$SHELL_STATUS%#"
    prompt_end
}

function precmd_prompt {
    vcs_info
    PROMPT="$(prompt_build)"
}

precmd_functions=($precmd_functions precmd_prompt)
