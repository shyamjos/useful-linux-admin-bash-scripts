#!/bin/sh
probe () {
  ping -c1 -w5 $1 >&- 2>&- || touch /tmp/pingfail.$1
}
echo "########################################################"
echo "#                Unused IP Finder V1.0 Shyam           #"
echo "########################################################"
echo Pinging IPs........
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 2
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo Loading list........
rm /tmp/pingfail.* 2>&-
for i in $(seq 1 255); do
  probe 192.168.0.$i &
done;
wait
for failip in /tmp/pingfail.*; do
  echo ${failip#*.}
done|sort -nt. -k1,1 -k2,2 -k3,3 -k4,4
rm /tmp/pingfail.* 2>&-


