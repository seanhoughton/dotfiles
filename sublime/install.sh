
function symlink_preference() {
	name=$1
	original="$HOME/Library/Application Support/Sublime Text 3/Packages/User/$name"
	new="$HOME/.dotfiles/sublime/$name"
	if [ -f "$original" ]; then
		echo "Making a backup of ${original}"
    	mv "$original" "${original}.backup"
	fi
	if [ ! -h "$original" ]; then
		echo "Creating symlink $original -> $new"
		ln -s "$new" "$original"
	fi
}

symlink_preference 'Preferences.sublime-settings'
symlink_preference 'Anaconda.sublime-settings'
symlink_preference 'Default (OSX).sublime-keymap'

