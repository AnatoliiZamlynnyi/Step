#! /bin/bash

PLACE=" Computer Academy STEP"
DATE=`date +"%d-%m-%Y"`
LOG=`sudo tail -10 /var/log/messages`
RICH="\033[1m"
FLASHING="\033[5m"
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
YELLOW="\033[33m"
AQUAMARINE="\033[36m"
END="\033[0m"


echo -e "\t\t$YELLOW Educational Institution$END:$RICH$BLUE$PLACE $END"
echo -e "$YELLOW Current Date$END:$RICH$RED$FLASHING $DATE $END"
echo -e "$YELLOW Local Host Name$END:$RICH$BLUE $HOSTNAME $END"
echo -e "$YELLOW Current User$END:$RICH$BLUE $USER $END"
echo -e "$YELLOW User Home directory$END:$RICH$GREEN $HOME $END"
echo -e "$YELLOW Logged In Users$END:$RICH$GREEN \n`w` $END"
echo -e "$YELLOW Time Passed$END:$RICH$RED$FLASHING `uptime -p` $END"
sleep 5
echo -e "$YELLOW Disk Use$END:$RICH$GREEN\n`df -h`$END"
sleep 3
echo -e "$YELLOW Network Configuration$END:$RICH$GREEN\n`ifconfig` $END"
sleep 3
echo -e "$YELLOW Log Records Are Left$END:$AQUAMARINE\n$LOG $END" 
sleep 3

