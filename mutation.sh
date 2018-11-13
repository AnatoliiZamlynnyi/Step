#! /bin/bash

NUM=`curl "https://app.bitpool.com/#/login&pane=organisation"| grep "bpoAppVersion" | grep -Eo "[0-9]+"`
HOUR=`date +"%H"`
MINUTES=`date +"%M"`
SUM=$(($HOUR+$MINUTES))
echo "Number from web resource app.bitpool.com" - "$NUM"
echo "Current hours" - "$HOUR"
echo "Current minutes" - "$MINUTES"
echo "Summa corrent hours and current minutes" - "$SUM"
echo "Mutation number from web resourse app.bitpool" - "$NUM+($HOUR+$MINUTES)="$(($NUM+$SUM))
rm -f bitpool
