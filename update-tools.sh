echo "Beginning package updates"
echo "Updating SET"
cd /pentest/exploits/set && git pull
echo "Updating Metasploit"
cd /pentest/exploits/framework3 && git pull
bundle install
echo "Updating Wapiti"
cd /pentest/web/wapiti && svn up
echo "Updating w3af"
cd /pentest/web/w3af && git pull 
echo "Updating waffit"
cd /pentest/web/waffit && svn up
echo "Updating Sulley"
cd /pentest/fuzzers/sulley && git pull 
echo "Updating Nikto"
cd /pentest/web/nikto && git pull
echo "Updating The Harvester"
cd /pentest/enumeration/theHarvester && git pull
echo "updating htshells"
cd /pentest/web/htshells && git pull
echo "Updating SSLyze"
cd /pentest/web/sslyze && git pull
echo "Updating WPScanner"
cd /pentest/web/wpscan && git pull
echo "Updating wfuzz"
cd /pentest/fuzzers/wfuzz && svn up
echo "Updating Beef"
cd /var/www/beef && sudo git pull
echo "Updating Fierce2"
cd /pentest/enumeration/fierce2 && svn up
echo "Updating Kismet"
cd /pentest/wireless/kismet && git pull
echo "Updating Aircrack Tools"
cd /pentest/wireless/aircrack-ng && svn up
echo "Updating fimap"
cd /pentest/web/fimap && git pull 
echo "Updating SQL Map"
cd /pentest/database/sqlmap && git pull
echo "Updatign FuzzDB"
cd /pentest/fuzzers/fuzzdb && svn up
echo "Updating WSFuzzer"
cd /pentest/fuzzers/wsfuzzer && svn up
echo "Updating Captcha Breaker"
cd /pentest/web/captcha-breaker && svn up
echo "Updating DNSMap"
cd /pentest/enumeration/dnsmap && svn up
echo "Updating SQLNinja"
cd /pentest/database/sqlninja && svn up
echo "Updating Laudanum"
cd /pentest/web/laudanum && svn up
echo "Updating JBroFuzz"
cd /pentest/fuzzers/jbrofuzz && svn up
echo "Updating PHP Shell"
cd /pentest/web/phpshell && svn up
echo "Updating DNS Enum"
cd /pentest/enumeration/dnsenum && git pull 
echo "Updating Pyrit"
cd /pentest/passwords/pyrit && svn up
echo "Updating Middler"
cd /pentest/exploits/middler && svn up
echo "Updating keimpx"
cd /pentest/exploits/keimpx && svn up
echo "Updating SIPVicious"
cd /pentest/voip/sipvicious/ && svn up
echo "Updating Router Defense"
cd /pentest/audit/routerdefense/ && svn up
echo "Updating Wifite"
cd /pentest/wireless/wifite && svn up
echo "Updating nmap - you will need to recompile if needed"
cd /pentest/scanners/nmap && svn up
echo "Updating ncat - you will need to recompile if needed"
cd /pentest/scanners/nmap/ncat && svn up
echo "Updating ncrack - you will need to recompile if needed"
cd /pentest/scanners/ncrack && svn up
echo "Updating Warvox"
cd /pentest/voip/warvox && git pull
echo "Updating WhatWeb"
cd /pentest/web/WhatWeb && git pull
echo "Updating Responder"
cd /pentest/exploits/Responder && git pull
echo "Updating SSL Split"
cd /pentest/web/sslsplit && git pull
echo "Updating netsniff-ng"
cd /pentest/misc/netsniff-ng && git pull
echo "Updating Jboss Autopwn"
cd /pentest/web/jboss-autopwn && git pull
echo "Updating Weape"
cd /pentest/wireless/weape && git pull
echo "Updating smbexec"
cd /pentest/exploits/smbexec && git pull
bundle install
#echo "Updating John the Ripper"
#cd /pentest/passwords/john && git pull
echo "Updating THC-Hydra"
cd /pentest/enumeration/hydra && git pull
echo "Updating wifijammer"
cd /pentest/wireless/wifijammer && git pull
echo "Updating Veil Catapult"
cd /pentest/exploits/Veil-Catapult && git pull
echo "Updating Veil Evasion"
cd /pentest/exploits/Veil-Evasion && git pull
echo "Updating Veil PowerView"
cd /pentest/exploits/Veil-PowerView && git pull
echo "Updating PCredz"
cd /pentest/passwords/PCredz && git pull
echo "Updating Recon-NG"
cd /pentest/enumeration/recon-ng/ && git pull
echo "Updating the ExploitDB archive"
cd /pentest/exploits/exploitdb && git pull
echo "Updating Passive Aggresive"
cd /pentest/enumeration/pasv-agrsv && git pull
echo "Updating Medusa"
cd /pentest/enumeration/medusa && git pull
echo "Updating Pentestly"
cd /pentest/exploits/pentestly && git pull
echo "Updating Rawr"
cd /pentest/web/rawr && git pull
echo "Updating CrackMapExec"
cd /pentest/exploits/CrackMapExec && git pull
echo "Updating XSSer"
cd /pentest/web/xsser && git pull
echo "Updating exploitdb"
cd /pentest/exploits/exploitdb && git pull
echo "Updating NoSQLMAP"
cd /pentest/database/NoSQLMap && git pull
echo "Updating Cloakify"
cd /pentest/exploits/cloakify && git pull
echo "Updating Bettercap"
sudo gem update bettercap
echo "Updating CrackMapExec"
cd /pentest/exploits/CrackMapExec && git pull
echo Updating keimpx
cd /pentest/exploits/keimpx && git pull
echo "Updating tplmap"
cd /pentest/web/tplmap && git pull
echo "Updating Cheatsheet Collection"
cd /pentest/misc/Cheatsheets && git pull
#
if [ -f /usr/sbin/openvas-nvt-sync ] ; then
echo "Updating OpenVAS"
sudo /usr/sbin/openvas-nvt-sync --wget
else
echo "OpenVAS is not installed, skipping"
fi
if [ -f /opt/nessus/sbin/nessuscli ] ; then
echo "Updating Nessus Plugins"
sudo /opt/nessus/sbin/nessuscli update --plugins-only
else
echo "Nessus is not installed, skipping"
fi
#
/pentest/enumeration/thc-ipv6/thcping6 | grep "v2.7"
if [ $? -eq 0 ] ; then
echo "THC IPv6 Attack Suite is up to date"
else
echo "THC IPv6 Attack Suite is not up to date, updating now"
rm -rf /pentest/enumeration/thc-ipv6 && /pentest/misc/va-pt/scripts/static.sh
fi
#
echo "Updating VA-PT"
cd /pentest/misc/va-pt && git pull 
echo "Updating the Vulnerability Database Portal"
cd /var/www/html/search && sudo git pull
#
while true; do
    read -p "Do you want to update the local exploit database? (y/n)" yn
    case $yn in
        [Yy]* ) /pentest/misc/va-pt/scripts/db-update.sh;  break;;
        [Nn]* ) echo "Exiting the updater."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
