FILE=.zshrc
if [ -f "~/$FILE" ]; then	
	echo "==> Config founded"
	mv "~/$FILE" "~/$FILE.bak"
	echo "==> Config moved to ~/.$FILE.bak"
fi
mv "$FILE" "~/$FILE"
cd /
rm -rf "./zshConfig/"
