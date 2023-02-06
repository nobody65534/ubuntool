cat /etc/sudoers | grep NOPASSWD.* >> /dev/null
if [ $? -eq 0 ]
then
echo "NOPASSWD FOUND. GO CHANGE IT."
echo "NOPASSWD FOUND. GO CHANGE IT." >> ubuntoollog
fi
cat /etc/sudoers | grep !authenticate >> /dev/null
if [ $? -eq 0 ]
then
echo "!authenticate found. GO CHANGE IT."
echo "!authenticate found. GO CHANGE IT." >> ubuntoollog

fi
read -p "Press [ENTER] key to continue" fakeenter

