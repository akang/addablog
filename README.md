# addablog

usage: read-android-log.sh {process_name}

where {process_name} is typically the name of the app that you defined in your Android manifest file.

The process name should turn up in:
adb -s  {device_id} shell ps
