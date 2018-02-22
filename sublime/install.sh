#!/usr/bin/env bash
set -e

if [ "$(uname -s)" == "Darwin" ]; then
	prefix="$HOME/Library/Application Support/Sublime Text 3"
	keymap="Default (OSX).sublime-keymap"
else
	prefix="$HOME/.config/sublime-text-3"
	keymap="Default (Linux).sublime-keymap"
fi


function symlink_preference() {
	name=$1
	original="$prefix/Packages/User/$name"
	new="$HOME/.dotfiles/sublime/$name"
	echo "Linking $original -> $new"
	if [ -f "$original" ]; then
     	rm "$original"
	fi
	if [ ! -h "$original" ]; then
		ln -s "$new" "$original"
	fi
}

echo 'Linking SublimeText preference files...'
if [ ! -f "$prefix/Installed Packages/Package Control.sublime-package" ]; then
	curl -s -f "https://packagecontrol.io/Package%20Control.sublime-package" > "$prefix/Installed Packages/Package Control.sublime-package"
fi

cd "${prefix}/Packages/User"
find . -type f -name "*.sublime-settings" | while read f; do
	symlink_preference $(basename "${f}")
done

symlink_preference "$keymap"


