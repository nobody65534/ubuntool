echo "Configuring pam"
echo "Configured pam" >> pam.log
sed -i 's/auth\trequisite\t\t\tpam_deny.so\+/auth\trequired\t\t\tpam_deny.so/' /etc/pam.d/common-auth
sed -i '$a auth\trequired\t\t\tpam_tally2.so deny=5 unlock_time=1800 onerr=fail' /etc/pam.d/common-auth
sed -i 's/sha512\+/sha512 remember=13/' /etc/pam.d/common-password
