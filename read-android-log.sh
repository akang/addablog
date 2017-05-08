#!/bin/bash
# author: aka 

if [ $# -eq 0  ]
  then echo "Usage: read-android.log.sh {process_name}"
  exit 1
fi

process_name=$1
echo "Checking logs for process: $process_name"
echo "Reading android log file via adb. This script only works for the 1st device listed in adb"

adb devices > /tmp/adb_devices.log


# assuming the output has the following format:
# List of devices attached
# 988627314253304545 device

device_info=`sed '2!d' /tmp/adb_devices.log` 
arr=($device_info)
device_id=${arr[0]}
echo "Device ID found: $device_id"

process_info=`adb -s $device_id shell ps|grep $process_name`
if [ -z "$process_info" ] 
  then echo "No process found that matches: $process_name"
  exit 1
fi

arr=($process_info)


adb -s $device_id shell logcat -v time|grep ${arr[1]}

