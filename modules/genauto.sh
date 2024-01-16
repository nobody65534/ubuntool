# Seperate soon
# Secure grub
sed -i '1s/.*/timeout 3/' /boot/grub/menu.lst
sed -i '2s/.*/password Greenbrier123!/' /boot/grub/menu.lst
# Secure ctrl alt del
echo 'root' > /etc/shutdown.allow
# Secure print screen/Magic SysRq
echo 'kernel.sysrq = 0' > /etc/sysctl.conf
