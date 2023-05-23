#!/bin/bash
# This script monitors CPU and memory usage

export DISPLAY=:0

scripttime=$(date +%F-%T)
# Get the current usage of CPU and memory
cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
memTotal=$(free -m | awk '/Mem/{print $2}')
memUsage=$(free -m | awk '/Mem/{print $3}')
memFree=$(free -m | awk '/Mem/{print $4}')
memAvail=$(free -m | awk '/Mem/{print $7}')
memPctFree=$(free -m | awk '/Mem/{print int($7/$2*100)}')

# Print the usage
echo "-----$scripttime-----"
echo "CPU Usage: $cpuUsage%"
echo "Memory Total: $memTotal MB"
echo "Memory Usage: $memUsage MB"
echo "Memory Free: $memFree MB"
echo "Memory Available: $memAvail MB"
echo "Memory Percent Free: $memPctFree%"

if [ $memPctFree -lt 20 ]
then
    notify-send -t 30000 -i face-crying "Low memory alert - $scripttime"
fi
