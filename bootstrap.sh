#!/bin/bash

# Rename current directory to make it hidden, cd into said directory
mv ../dotfiles ../.dotfiles
cd ../.dotfiles

# Make desired folders
mkdir "$HOME/bin"
mkdir "$HOME/Projects"
chown $USER:$USER "$HOME/bin"
chown $USER:$USER "$HOME/Projects"

# Symlink all files in current directory to home directory
for file in $( ls -A | grep -vE '*\.sh|\.git$|\.gitignore|*\.md|LICENSE' ) ; do
	ln -sv "$PWD/$file" "$HOME"
    chown -h $USER:$USER "$HOME/$file"
done

apt update && apt upgrade
apt install snapd wget

snap install spotify
snap install atom --classic
snap install slack --classic

snap install htop
snap connect htop:mount-observe
snap connect htop:process-control
snap connect htop:system-observe
snap connect htop:network-control

snap install brave

apm install atom-beautify
apm install file-icons
apm install platformio-ide-terminal
apm install minimap
