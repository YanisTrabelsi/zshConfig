#!/bin/zsh
FILE=.zshrc
SRC_DIR=$(pwd)
if [ -f "$HOME/$FILE" ]; then	
	echo "==> Config founded"
	mv "$HOME/$FILE" "$HOME/$FILE.bak"
	echo "==> Config moved to $HOME/.$FILE.bak"
fi
mv "$FILE" "$HOME/$FILE"
rm -rf "$SRC_DIR"
cd $HOME
echo "==> .zshrc installed !"
