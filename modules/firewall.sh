dpkg -l | grep ufw >> firewall.log
		if [ $? -eq 1 ]
		then
			apt-get install ufw >> output.log
		fi
sudo ufw enable >>output.log
sudo ufw status >> output.log
sleep 1
ufw status
read -p "Press [ENTER] key to continue"
