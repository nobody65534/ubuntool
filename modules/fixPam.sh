#!/bin/bash

# Backup original PAM configuration files
cp /etc/pam.conf /etc/pam.conf.bak
cp -R /etc/pam.d /etc/pam.d.bak

# Function to rollback changes in case of errors
rollback_changes() {
    echo "Error occurred. Rolling back changes..."
    # Restore original PAM configuration files from backups
    cp /etc/pam.conf.bak /etc/pam.conf
    cp -R /etc/pam.d.bak/* /etc/pam.d/
    # Restart PAM-aware services
    service sshd restart
    service nginx restart
    # Add any other PAM-aware services that need to be restarted
    exit 1
}

# Updating PAM configuration files

# Updating /etc/pam.conf
echo "auth       required     pam_unix.so" >> /etc/pam.conf || rollback_changes
echo "account    required     pam_unix.so" >> /etc/pam.conf || rollback_changes
echo "password   required     pam_unix.so" >> /etc/pam.conf || rollback_changes
echo "session    required     pam_unix.so" >> /etc/pam.conf || rollback_changes

# Updating /etc/pam.d/common-auth
echo "auth       required     pam_faillock.so preauth silent audit deny=3 unlock_time=900" >> /etc/pam.d/common-auth || rollback_changes
echo "auth       [default=die] pam_faillock.so authfail audit deny=3 unlock_time=900" >> /etc/pam.d/common-auth || rollback_changes
echo "auth       sufficient   pam_faillock.so authsucc audit deny=3 unlock_time=900" >> /etc/pam.d/common-auth || rollback_changes

# Updating /etc/pam.d/common-account
echo "account    required     pam_unix.so" >> /etc/pam.d/common-account || rollback_changes

# Updating /etc/pam.d/common-password
echo "password   required     pam_unix.so" >> /etc/pam.d/common-password || rollback_changes

# Updating /etc/pam.d/common-session
echo "session    required     pam_unix.so" >> /etc/pam.d/common-session || rollback_changes

# Restarting PAM-aware services
service sshd restart || rollback_changes
service nginx restart || rollback_changes
# Add any other PAM-aware services that need to be restarted

# Cleanup backup files
rm /etc/pam.conf.bak
rm -r /etc/pam.d.bak

# PAM Things for /etc/pam.d/login
echo 'auth     requisite  pam_securetty.so' | sudo tee -a /etc/pam.d/login
echo 'session  required   pam_limits.so' | sudo tee -a /etc/pam.d/login

# Control of su in PAM (/etc/pam.d/su)
echo 'auth     requisite   pam_wheel.so group=wheel debug' | sudo tee -a /etc/pam.d/su

# Configuration for undefined PAM applications
echo 'auth     required       pam_securetty.so' >> /etc/pam.d/other
echo 'auth     required       pam_unix_auth.so' >> /etc/pam.d/other
echo 'auth     required       pam_warn.so' >> /etc/pam.d/other
echo 'auth     required       pam_deny.so' >> /etc/pam.d/other
echo 'account  required       pam_unix_acct.so' >> /etc/pam.d/other
echo 'account  required       pam_warn.so' >> /etc/pam.d/other
echo 'account  required       pam_deny.so' >> /etc/pam.d/other
echo 'password required       pam_unix_passwd.so' >> /etc/pam.d/other
echo 'password required       pam_warn.so' >> /etc/pam.d/other
echo 'password required       pam_deny.so' >> /etc/pam.d/other
echo 'session  required       pam_unix_session.so' >> /etc/pam.d/other
echo 'session  required       pam_warn.so' >> /etc/pam.d/other
echo 'session  required       pam_deny.so' >> /etc/pam.d/other

# Successful completion
echo "PAM has been updated successfully."
exit 0
