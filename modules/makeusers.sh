echo "Enter the name of the user you would like to add."
read -p "> " newuser
useradd $newuser
echo "Is this user an admin or standard user?"
read -p "> " as
case $as in
admin) usermod -aG sudo $newuser;;
esac
echo "$newuser added as $as"
echo "$newuser added as $as" >> ubuntoollog

read -p "Press [ENTER] key to continue" fakeenter
