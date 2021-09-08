#!/bin/bash

musage=$(free | awk '/Mem/{printf("%.2f%\n"), $3/$2*100}'|  awk '{print $3}' | cut -d"." -f1 )

if [[ $musage -ge 70 ]] 
then 
	echo "Current memory usage: $musage"
	top -b -n 1 | head -n 12  > util
	sed -e '1,5d' <  util | awk {'print $1"  "$9"  "$10"  " $11"  "$12'}



else 
	echo " Performance is stable "

fi

echo "* * * * * root /root/Common_Shell_Scripts/ram_usage.sh" > /etc/cron.d/automation

