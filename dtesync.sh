#!/bin/sh
BPATH=/var/lib/GTS/logsgps/GPS

ACTFILE=$(cat $BPATH/conf | awk -F= '{ printf("%02d", $2)}')

DATETIME=$(tail -n1 $BPATH/LOGGPS$ACTFILE.txt | awk -F, '{print $11}')

echo $ACTFILE
echo $DATETIME

ANO=$(echo $DATETIME | cut -c1-2)
MES=$(echo $DATETIME | cut -c4-5)
DIA=$(echo $DATETIME | cut -c7-8)

DTE=$(echo "$ANO$MES$DIA")
echo $DTE

TM=$(echo "$DATETIME" | cut -c10-17)
echo $TM
#echo $TM
#$(echo $DATE | cut -c5-6)

date +%Y%m%d -s "$DTE"
date +%T -s "$TM"

hwclock --set --date="$DATETIME"  --utc

exit
