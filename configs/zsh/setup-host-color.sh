#!/bin/bash

request_color() {
    echo "Enter new host color: "
    read -r color
}

if [ -f ~/.zshenv.local ] && grep -qe "^export HOST_COLOR=" ~/.zshenv.local; then
    echo "Host color set to "
    echo -n "> "
    grep -e "^export HOST_COLOR=" ~/.zshenv.local
    echo -n "Reset host color? [y/N] "
    read -rn1 input
    echo
    if [ "$input" = "y" ]; then
        request_color
        sed -i "s/^export HOST_COLOR=.*$/export HOST_COLOR=\"$color\"/g" ~/.zshenv.local
    fi
else
    echo "Host color not set"
    echo -n "Set host color? [y/N] "
    read -rn1 input
    echo
    if [ "$input" = "y" ]; then
        request_color
        echo "export HOST_COLOR=\"$color\"" >> ~/.zshenv.local
    fi
fi
