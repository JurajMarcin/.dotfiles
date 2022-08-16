#!/bin/bash

for i in $@; do :; done
TARGET="$i"

while (( $# > 1 )); do
    if [ -d "$TARGET" ]; then
        target_file="$TARGET/`basename $1`"
    else
        target_file="$TARGET"
    fi

    if diff "$1" "$target_file" &>/dev/null; then
        echo "$1 and $target_file are same"
    else
        if [ -f "$target_file" ]; then
            echo "$1 and $target_file same, running nvim -d"
            nvim -d "$1" "$target_file"
        else
            cp -iv "$1" "$target_file"
        fi
    fi
    shift
done
