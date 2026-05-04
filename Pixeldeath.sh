#!/bin/sh
printf '\033c\033]0;%s\a' Pixeldeath
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Pixeldeath.x86_64" "$@"
