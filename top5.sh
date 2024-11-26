#!/bin/bash
if [ -z $SUDO_USER ]
then echo "You don't have root privileges, run script with sudo!"
exit 1
fi
if ! [ -d /opt/mon ]; then
mkdir /opt/mon
fi
date_now=$(date +"%m_%e_%H_%M_%S")
touch /opt/mon/$date_now
ps -e --sort -pcpu -o pcpu -o pid -o user -o command | sed -n '1,6p' > /opt/mon/$date_now 
echo "Check /opt/mon/$date_now to know top 5 processes with high %CPU!"
