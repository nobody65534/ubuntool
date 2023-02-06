mp3finds=()
mp4finds=()
mp3finds=$(locate "*.mp3*")
mp4finds=$(locate "*.mp4*")
echo "These prohibited files are on your system:"
echo "$mp3finds"
echo "$mp4finds"
read -p "Press [ENTER] key to continue" fakeenter
for mp3find in $mp3finds
do
clear
echo "Do you want to remove this one?"
echo "$mp3find"
read -p "> " yn
case $yn in
y) rm "$mp3find";;
n)
esac
done
read -p "Press [ENTER] key to continue" fakeenter
