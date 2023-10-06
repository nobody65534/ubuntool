sed -i 's/LoginGraceTime .*/LoginGraceTime 60/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin .*/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/Protocol .*/Protocol 2/g' /etc/ssh/sshd_config
sed -i 's/#PermitEmptyPasswords .*/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication .*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/X11Forwarding .*/X11Forwarding no/g' /etc/ssh/sshd_config
read -p "Press [ENTER] key to continue" fakeenter
