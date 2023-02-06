clear
echo "Updating..."
apt update
apt upgrade
apt install unattended-upgrades apt-listchanges bsd-mailx
dpkg-reconfigure -plow unattended-upgrades
apt purge firefox
apt install firefox

read -p "Press [ENTER] key to continue" fakeenter
