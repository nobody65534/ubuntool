
clear
echo "These are your current system services:"
systemctl --type=service --state=active
while true; do
echo "Enter name of service to add, or type n to quit"
read -p "> " servicename
if [ $servicename == "n" ]; then
read -p "Press [ENTER] key to continue" fakeenter
exit
else
apt install "$servicename" -y
systemctl enable "$servicename"
fi
done
read -p "Press [ENTER] key to continue" fakeenter
