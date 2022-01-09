# vim: ft=tmux

%if #{==:#{HOST_COLOR},}
PRI_BG=green
%else
PRI_BG="$HOST_COLOR"
%endif
PRI_FG=black
SEC_BG=black
SEC_FG=white

# Statusbar
set -g status-style "bg=$SEC_BG fg=$SEC_FG"
set -g status-right "#[bg=$SEC_BG fg=$PRI_BG]#[bg=$PRI_BG fg=$PRI_FG bold] %a %d/%m %R "
set -g status-left  "#[bg=$PRI_BG fg=$PRI_FG bold] #S #[bg=$SEC_BG fg=$PRI_BG] "
set -g status-left-length 20

set -g window-status-activity-style  "bg=brightred fg=black"
set -g window-status-bell-style  "bg=red fg=black"
set -g window-status-current-style  "bg=yellow fg=black bold"
set -g window-status-last-style  "bold"
set -g window-status-style  'bg=brightblack fg=white'

set -g window-status-current-format "#[fg=$SEC_BG]#[fg=default] #I #W #[reverse fg=$SEC_BG]"
set -g window-status-format "#[fg=$SEC_BG]#[fg=default] #I #W #[reverse fg=$SEC_BG]"

set-option -ga terminal-overrides ",xterm-256color:Tc"
set -g default-terminal "screen-256color"
