clear
echo "Updating..."
apt update
apt upgrade
apt install unattended-upgrades apt-listchanges bsd-mailx
dpkg-reconfigure -plow unattended-upgrades
read -p "foxfire +1 1(ye) o 0(nah)" x
if [ x == '1' ]; then 
  apt purge firefox
  apt install firefox
fi
read -p "Press [ENTER] key to continue" fakeenter
