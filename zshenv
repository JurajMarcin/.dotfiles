# Gnome Keyring
gnome-keyring-daemon --start >/dev/null

# GnuPG
unset SSH_AGENT_PID
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# User scripts
export PATH="$HOME/.local/bin:$PATH"

# Misc
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Theming
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=adwaita-dark

# Programs
export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG="nvim -d"
