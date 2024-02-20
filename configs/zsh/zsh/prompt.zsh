autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '  '
zstyle ':vcs_info:*' unstagedstr '  '
zstyle ':vcs_info:*' formats "%b%c%u"
zstyle ':vcs_info:*' actionformats "%b (%a)%c%u"

DEFAULT_COLOR=${HOST_COLOR:-green}
if [ $(id -u) = "0" ]; then
    USER_COLOR="red"
else
    USER_COLOR=$DEFAULT_COLOR
fi

function prompt_part {
    echo -n " %F{$1}$2%f$3 %F{$1}\ue0b1%f"
}

function prompt_build {
    prompt_part $DEFAULT_COLOR " " "%n@%M"
    prompt_part "blue" " " " %~"
    echo -n "%(?..`prompt_part "red" " " "%?"`)"
    echo -n "%1(j.$(prompt_part "yellow" "󱍔 " "%j").)"
    [[ -n ${vcs_info_msg_0_} ]] && prompt_part magenta "󰊢 " " $vcs_info_msg_0_"
    [[ -n ${VIRTUAL_ENV} ]] && prompt_part cyan "󰌠 " "$(basename "$VIRTUAL_ENV")"
    echo
    prompt_part $USER_COLOR "" "$SHELL_STATUS%#"
    echo -n " "
}

function precmd_prompt {
    vcs_info
    PROMPT="$(prompt_build)"
}

precmd_functions=($precmd_functions precmd_prompt)
