all_users=$(cat /etc/passwd | cut -d ":" -f 1)
for user in $all_users
do
uid=$(id -u "$user")
if [ $uid -ge 0 ] && [ $uid -le 999 ]; then
echo "- $user"
fi
done
read -p "Press [ENTER] key to continue" fakeenter
