#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
FILES=$SCRIPTPATH/*.ahk
for file in $FILES
do
    if [ ! -d "$file" ]; then
        echo "Starting $file..."
        timeout 1s "/mnt/c/Program Files/AutoHotkey/AutoHotkey.exe" /r "\\\\wsl\$\Ubuntu\\$file"
    fi
done
