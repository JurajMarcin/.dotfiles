#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if ! type "xrandr"; then
    polybar --reaload main &
    exit
fi

# List Primary and secondary monitors
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch Polybar on primary monitor and wait one second for system tray to show up
if [ -n "$PRIMARY" ]; then
    MONITOR=$PRIMARY polybar --reload main &
fi

sleep 1

# Launch Polybar on other monitors
for m in $OTHERS; do
    MONITOR=$m polybar --reload main &
done
