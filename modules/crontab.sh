!/bin/bash
# COLORS UTIL
# ECHO DOES NOT SUPPORT COLORS BY DEFAULT, USE ECHO -E
# FORMAT FOR COLORS IS \e[COLORm
# COLOR IS COLOR CODE
# COLOR MUST BE RESET WHEM FINISHED
# STANDARD (FOREGROUND) COLORS
black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
lgray="\e[37m"
gray="\e[90m"
lred="\e[91m"
lgreen="\e[92m"
lyellow="\e[93m"
lblue="\e[94m"
lmagenta="\e[95m"
lcyan="\e[96m"
# SPECIAl COLORS
reset="\e[0m"
bold="\e[1m"
faint="\e2m"
italic="\e3m"
underlined="\e4m"
#UNCOMMENT LINE FOR TEST
#echo -e "$red C $green O $yellow L $blue O $magenta R $cyan $reset S"
# This script checks non-default crontabs
echo "opening crontab file"
crontabs=$(ls /var/spool/cron/crontabs)
echo -e "List of crontabs:\n $crontabs"
for crontab in $crontabs; do
        echo -e "$lgreen File is: $crontab $reset"
        echo "File is: $crontab" >> crontabs.log
        cat /var/spool/cron/crontabs/$crontab
        cat /var/spool/cron/crontabs/$crontab >> crontabs.log
        read -p "Would you like to delete this crontab? [y/N]" yn
        clear
        if [[ ! $yn =~ ^[Yy]$ ]]; then
                continue
        fi
        rm /var/spool/cron/crontabs/$crontab
done
