# User scripts
export PATH="$HOME/.local/bin:$PATH"

# Misc
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Programs
export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG="nvim -d"

if [ -f ~/.zshenv.local ]; then
    source ~/.zshenv.local
fi
