FILE=.zshrc
if [ -f "~/$FILE" ]; then
	mv "~/$FILE" "~/$FILE.bak"
fi
mv $FILE ~/$FILE
cd /
rm -rf /zshConfig
