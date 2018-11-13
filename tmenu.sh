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
	echo "Local host name:" - "$HOSTNAME"
	sleep 3 
	clear
;;
U)
	echo "Corrent User:" - "$USER"
	sleep 3
	clear
;;
H)
	echo "User home directory:" - "$HOME"
	sleep 3
	clear
;;
L)
	echo "Logget in User"
	w
	sleep 3
	clear
;;
T)
	echo "Time passed: "  `uptime -p`
	sleep 3
	clear
;;
D)
	echo "Disk use:"
	df -h
	sleep 3
	clear
;;
I)
	echo "Network configuration:"
	ifconfig
	sleep 3
	clear
;;
S)
	echo "Log records are left:"
	sudo tail -10 /var/log/messages
	sleep 3
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
