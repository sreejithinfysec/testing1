#!/bin/bash
if [[ $EUID -eq 0 ]]; then
echo "This script must not be run as root.." 1>&2
exit 1
fi
if [ ! -f /etc/sudoers ] ; then
su -c 'apt-get install -y sudo'
/usr/sbin/usermod -a -G sudo $USER
fi
if [ ! -f /usr/sbin/ntpdate ] ; then
sudo apt-get install -y ntpdate
else
sudo ntpdate time.nist.gov
fi
if [ ! -f /usr/bin/svn ] ; then
su -c 'apt-get install -y subversion'
fi
if [ ! -d /pentest ] ; then
sudo mkdir /pentest
sudo chown -R $USER /pentest && chgrp -R $USER /pentest
fi
[ ! -d /pentest/temp ] && mkdir /pentest/temp
[ ! -d /pentest/exploits ] && mkdir /pentest/exploits
[ ! -d /pentest/web ] && mkdir /pentest/web
[ ! -d /pentest/scanners ] && mkdir /pentest/scanners
[ ! -d /pentest/misc ] && mkdir /pentest/misc
[ ! -d /pentest/enumeration ] && mkdir /pentest/enumeration
[ ! -d /pentest/voip ] && mkdir /pentest/voip
[ ! -d /pentest/database ] && mkdir /pentest/database
[ ! -d /pentest/passwords ] && mkdir /pentest/passwords
[ ! -d /pentest/fuzzers ] && mkdir /pentest/fuzzers
[ ! -d /pentest/spoofing ] && mkdir /pentest/spoofing
[ ! -d /pentest/cisco ] && mkdir /pentest/cisco
[ ! -d /pentest/tunneling ] && mkdir /pentest/tunneling
if [ ! -d /pentest/misc/va-pt ] ; then
cd /pentest/misc && svn checkout http://va-pt.googlecode.com/svn/trunk/ va-pt
fi
clear
selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "|\     /|(  ___  )       (  ____ )\__   __/"
     echo "| )   ( || (   ) |       | (    )|   ) (   "
     echo "| |   | || (___) | _____ | (____)|   | |   "
     echo "( (   ) )|  ___  |(_____)|  _____)   | |   "
     echo " \ \_/ / | (   ) |       | (         | |   "
     echo "  \   /  | )   ( |       | )         | |   "
     echo "   \_/   |/     \|       |/          )_(   "
     echo ""
     echo ""
     echo "The Vulnerability Assessment and Penetration Testing Toolkit"
     echo ""
     echo "VA/PT PROGRAM MENU"
     echo "1 - Install Dependencies"
     echo "2 - Install SVN Toolkits"
     echo "3 - Install Static Code Software"
     echo "4 - Update all tool packages"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) /pentest/misc/va-pt/sheevaplug/deps.sh;;
         2 ) /pentest/misc/va-pt/sheevaplug/svn.sh;;
         3 ) /pentest/misc/va-pt/sheevaplug/static.sh;;
         4 ) /pentest/misc/va-pt/sheevaplug/update-tools.sh;;
         0 ) exit;;
         * ) echo "Please enter your selection"
     esac
done

