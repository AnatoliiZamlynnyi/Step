#! /bin/bash

PLACE="Computer Academy STEP"
DATE=`date +"%d-%m-%Y"`

main() {
while true;
do
clear
echo "$PLACE"
echo "$DATE"
echo "N - Local host name"
echo "U - Corrent User"
echo "H - User home directory"
echo "L - Logget in User"
echo "T - Time passed"
echo "D - Disk use"
echo "I - Network configuration"
echo "S - Log records are left"
echo "X - Exit"

read a

case $a in
N)
	echo "$HOSTNAME"
	sleep 5
	clear
;;
U)
	echo "$USER"
	sleep 5
	clear
;;
H)
	echo "$HOME"
	sleep 5
	clear
;;
L)
	w
	sleep 5
	clear
;;
T)
	uptime -p
	sleep 5
	clear
;;
D)
	df -h
	sleep 5
	clear
;;
I)
	ifconfig
	sleep 5
	clear
;;
S)
	sudo tail -10 /var/log/secure
	sleep 5
	clear
;;
X)
	exit 0
	;;
*)
	echo "Enter ERROR"
	sleep 2
	clear
;;
esac
done
}
main
