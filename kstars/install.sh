#!/usr/bin/env bash

set -e

if [ "$(uname -s)" == "Darwin" ]; then
	prefix="$HOME/Library/Preferences"
else
	prefix="$HOME/.kde/share/config"
fi


function symlink_preference() {
	name=$1
	original="$prefix/$name"
	new="$HOME/.dotfiles/kstars/$name"
	if [ -f "$original" ]; then
     	mv "$original" "${original}.backup"
	fi
	if [ ! -h "$original" ]; then
		ln -s "$new" "$original"
	fi
}

echo 'Linking KStars preferences'
symlink_preference 'kstarsrc'
