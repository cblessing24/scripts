#!/bin/bash

account=$(echo '' | dmenu -p "Account:" -fn '-xos4-terminus-medium-r-*-*-14-*' -b)
code=$(ykman oath accounts code --single "$account" 2> /dev/null)  || { dunstify \
    --hints='string:x-dunst-stack-tag:oath_code' \
    --appname='oath_code.sh' \
    "No account with name '$account'"; exit 1; }
echo "$code" | xclip -selection c
