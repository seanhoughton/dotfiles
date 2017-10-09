#!/usr/bin/env bash

set -e

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

source_file="${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
target_file="${HOME}/.dotfiles/iterm/com.googlecode.iterm2.plist"

echo 'Linking iTerm2 preferences'

if [ -f "${source_file}" ]; then
	mv "${source_file}" "${source_file}.backup"
fi

ln -s "${target_file}" "${source_file}"
