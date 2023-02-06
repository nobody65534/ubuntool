echo "Enter name of what you wish to reinstall"
read -p "> " reinst
echo "Reinstalling $reinst"
apt purge $reinst -y
apt install $reinst -y
read -p "Press [ENTER] key to continue" fakeenter
currentdirectory=$(pwd)
