# Had to learn grep for this bs
nopswd=$(grep -E '!root_squash|NOPASSWD|!authenticate' /etc/sudoers)

if [ -n "$nopswd" ]; then
	# Log the log to the log
	echo $nopswd > ubuntoollog
	# Would technically be better to use visudo but its wtv
	sed -i '/NOPASSWD/d' /etc/sudoers	# Allows sudo priv w/out password
	sed -i '/!authenticate/d' /etc/sudoers	# Allows sudo priv w/out password
	sed -i '/!root_squash/d' /etc/sudoers	# Environment specififc but usually bad
	echo "Sudoers check Complete" 
else
	echo "Sudoers check Complete" 
fi
