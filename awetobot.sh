#!/bin/bash

installApps()
{
# Print usage info, if --help, set mode, etc.
# Temporary colors
RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
CYAN="$(tput setaf 6)"
NORMAL="$(tput sgr0)"

# Only root can run this
id | grep -i "uid=0(" >/dev/null
if [ "$?" != "0" ]; then
  uname -a | grep -i CYGWIN >/dev/null
  if [ "$?" != "0" ]; then
    echo "${RED}Fatal:${NORMAL} error: Installer needs root permission to run, please run as root."
    exit 1
  fi
fi

logfile="/var/log/awetobot-install.log"

echo " "
echo "Starting Installation"
apt update
apt -q -y install apache2 mysql-server php libapache2-mod-php php-ssh2 php-mbstring php-curl php-gd php-mysql php-zip php-bz2
apt -q -y install software-properties-common nmap composer curl net-tools tftp-hpa tftpd-hpa mc openssh-server
echo " "
echo "Installation Complete!"
echo "Please to rebooting the machine.."
    OS="$REPLY" ## <-- This $REPLY is about OS Selection
    echo ""
    echo "We can install Apache, PHP, MYSQL and other application support"
    echo "Please select 'y' for each item you would like to install."
    echo "NOTE: To make sure agent is working"
    echo "      Please do not distrub or break the installer while is still running."
    echo ""
    echo ""
  exit 1
}

echo ""
echo "Let's figure out which OS / Distro you are running."
echo ""
echo ""
echo "From some basic information on your system, you appear to be running: "
echo "  " $(lsb_release -i)
echo "  " $(lsb_release -d)
echo "  " $(lsb_release -r)
echo "  " $(lsb_release -c)
echo ""
echo ""
PS3="Please select the number: "
select _ in \
    "Continue install" \
    "End this Installer"
do
  case $REPLY in
    1) installApps ;;
    2) exit ;;
    *) echo "Invalid selection, please try again..." ;;
  esac
done
