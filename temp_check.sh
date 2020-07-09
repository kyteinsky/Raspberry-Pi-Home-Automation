#!/bin/bash

temp=$(vcgencmd measure_temp | grep -E -o '[0-9]{,3}\.[0-9]{,3}')
int=${temp%.*}

if [ $int -ge 60 ]
then
    echo Hot
    node-red-stop
    crontab -l -u pi > /tmp/pi.cron.tmp
    crontab -r -u pi
    sleep 5m
    node-red-start
    crontab -u pi /tmp/pi.cron.tmp
fi

