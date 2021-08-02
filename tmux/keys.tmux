# vim: ft=tmux

# Reload config
bind    C-r     source-file ~/.tmux.conf

# Kill
bind    C-q     kill-session

# Switch windows
bind -n M-[     previous-window
bind -n M-]     next-window

# Split window (create pane)
bind    C-v     split-window -v
bind    C-h     split-window -h

# Switch panes
bind -n M-Left  select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up    select-pane -U
bind -n M-Down  select-pane -D

bind -n M-h     select-pane -L
bind -n M-l     select-pane -R
bind -n M-k     select-pane -U
bind -n M-j     select-pane -D

# Resize panes
bind    M-Left  resize-pane -L 5
bind    M-Right resize-pane -R 5
bind    M-Up    resize-pane -U 5
bind    M-Down  resize-pane -D 5

bind    M-h     resize-pane -L 5
bind    M-l     resize-pane -R 5
bind    M-k     resize-pane -U 5
bind    M-j     resize-pane -D 5
